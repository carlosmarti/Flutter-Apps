import 'package:flutter/material.dart';
import 'package:calculator/gridwidget.dart';
import 'calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditController = TextEditingController();
  String text = "";

  List<int> numbers = List.generate(10, (index) => index += 1);

  @override
  void initState() {
    super.initState();
    _textEditController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textEditController.dispose();
  }

  void addText(String text) {
    setState(() {
      Calculator().addText(text);
    });
  }

  void addOpSymbol(String symbol) {
    setState(() {
      Calculator().addOpSymbol(symbol);
    });
  }

  void submit(){
    setState(() {
      Calculator().submit();
    });
  }

  void clearCalc(){
    setState(() {
      Calculator().reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        title: Text(widget.title),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24.0),
      ),
      backgroundColor: Colors.black45,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Calculator().getText(),
              textAlign: TextAlign.end,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 54.0,
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            GridViewWidget(
              addTextMethod: addText,
              addOpSymbol: addOpSymbol,
              onSubmit: submit,
              onReset: clearCalc,
            ),
          ],
        ),
      ),
    );
  }
}
