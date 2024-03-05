import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key, required this.addTextMethod, required this.addOpSymbol, required this.onSubmit, required this.onReset});

  final Function addTextMethod;
  final Function addOpSymbol;
  final Function onSubmit;
  final Function onReset;


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      shrinkWrap: true,
      children: [
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addTextMethod("7");
          },
          child: const Center(
            child: Text("7"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addTextMethod("8");
          },
          child: const Center(
            child: Text("8"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addTextMethod("9");
          },
          child: const Center(
            child: Text("9"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addOpSymbol("/");
          },
          child: const Center(
            child: Text("/"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addTextMethod("4");
          },
          child: const Center(
            child: Text("4"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addTextMethod("5");
          },
          child: const Center(
            child: Text("5"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addTextMethod("6");
          },
          child: const Center(
            child: Text("6"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addOpSymbol("*");
          },
          child: const Center(
            child: Text("*"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addTextMethod("1");
          },
          child: const Center(
            child: Text("1"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addTextMethod("2");
          },
          child: const Center(
            child: Text("2"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addTextMethod("3");
          },
          child: const Center(
            child: Text("3"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addOpSymbol("+");
          },
          child: const Center(
            child: Text("+"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            onReset();
          },
          child: const Center(
            child: Text("C"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addTextMethod("0");
          },
          child: const Center(
            child: Text("0"),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            onSubmit();
          },
          child: const Center(
            child: Text("="),
          ),
        ),
        OutlinedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(fontSize: 24.0))),
          onPressed: () {
            addOpSymbol("-");
          },
          child: const Center(
            child: Text("-"),
          ),
        ),
      ],
    );
  }
}
