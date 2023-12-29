import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoList(title: 'Todo', todoStorage: TodoStorage()),
    );
  }
}

class TodoStorage{
  const TodoStorage();

  Future<String> get _localPath async{
    final directory = await getApplicationDocumentsDirectory();
    
    return directory.path;
  }

  Future<File> get _localFile async{
    final path = await _localPath;

    return File('$path/todos.txt');
  }

  Future<File> writeTodo(List<Todo> todos) async{
    final file = await _localFile;

    String sTodos = "";
    
    todos.forEach((element) { 
      var name = element.name;
      sTodos += "$name,";
    });

    for(int i = 0; i <= todos.length; i++){

      //don't add the last element because it is blank
      if( i != 0 && (i + 1) >= todos.length){
        continue;
      }

      var name = todos[i].name;
      sTodos += name;
    }

    return file.writeAsString(sTodos);
  }

  Future<List<Todo>> readTodoFile() async{

    final file = await _localFile;
    final content = await file.readAsString();
    
    String strContent = content.toString();
    var spltContent = strContent.split(",");
    print("content of split: $spltContent");
    
    final td = <Todo>[];

    if(spltContent.iterator.moveNext()){
      spltContent.forEach((element) {
      print("$element");
      td.add(Todo(name: element, checked: false));
     });
    }

    return td;
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.title, required this.todoStorage});

  final String title;
  final TodoStorage todoStorage;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Todo> _todolist = <Todo>[];
  final TextEditingController __textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    widget.todoStorage.readTodoFile().then((value) {
        setState(() {
          _todolist.addAll(value);  
        });
      });
  }

  void _addTodo(String name) {
    setState(() {
      _todolist.add(Todo(name: name, checked: false));
    });

    __textEditingController.clear();
  }

  void _changeTodo(TextEditingController newName, Todo todo){
    setState(() {
      var elemIndex = _todolist.indexOf(todo);
      _todolist[elemIndex].name = newName.text;
    });

    //clear input (if not done, when itemList object clicked. It shows the last input in TextField)
    newName.text = "";
  }

  Future<File> _saveTodos(){

    return widget.todoStorage.writeTodo(_todolist);
  }

  void _handleTodoChecked(Todo todo){

    setState(() {
      todo.checked = !todo.checked;
    });
  }

  void _deleteTodo(Todo todo){
    setState(() {
      _todolist.removeWhere((element) => element.name == todo.name);
    });
  }

  void _showSnackBar(){
    var snackBar = SnackBar(
      content: const Text("No Items in Todo, please add some todo items!"),
      action: SnackBarAction(
        label: "Remove", 
        onPressed: () {},),
        );

    if (_todolist.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> _addTodoDisplayDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Todo"),
          content: TextField(
            controller: __textEditingController,
            decoration: const InputDecoration(hintText: "Enter Todo"),
            autofocus: true,
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSnackBar();
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _addTodo(__textEditingController.text);
              },
              child: const Text("Add"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _changeItemDisplayDialog(Todo todo) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Change Todo"),
          content: TextField(
            controller: __textEditingController,
            decoration: const InputDecoration(hintText: "Enter new Todo"),
            autofocus: true,
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _changeTodo(__textEditingController, todo);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Change"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: _todolist.map( (Todo todo) {
          return TodoItem(
            todo: todo,
            onTodoChecked: _handleTodoChecked,
            removeTodo: _deleteTodo,
            changeTodo: _changeItemDisplayDialog,
          );
        }).toList(),
      ),
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 30,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () => _addTodoDisplayDialog(),
              tooltip: 'Add a Todo',
              child: const Icon(Icons.add),
            )
          ),
          Positioned(
            right: 30,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () => _saveTodos(),
              tooltip: 'Save Todos',
              child: const Icon(Icons.save),
            )
          ),
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Todo {
  Todo({required this.name, required this.checked});

  String name;
  bool checked;
}

class TodoItem extends StatelessWidget{
  TodoItem({required this.todo, required this.onTodoChecked, required this.removeTodo, required this.changeTodo}) : super(key: ObjectKey(todo));

  final Todo todo;
  final void Function(Todo todo) onTodoChecked;
  final void Function(Todo todo) removeTodo;
  final Future<void> Function(Todo todo) changeTodo;

  TextStyle? _getTextStyle(bool checked){
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black45,
      decoration: TextDecoration.lineThrough
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {changeTodo(todo);},
      leading: Checkbox(
        checkColor: Colors.greenAccent,
        activeColor: Colors.red,
        value: todo.checked,
        onChanged: (value) {onTodoChecked(todo);},
      ),
      title: Row(children: [
        Expanded(child:
          Text(
            todo.name,
            style: _getTextStyle(todo.checked),
            ),
        ),
        IconButton(
          iconSize: 30,
          alignment: Alignment.centerRight,
          onPressed: () {removeTodo(todo);}, 
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          )),
      ]),
    );
  }
}
