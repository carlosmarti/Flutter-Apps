import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: "Cupertino app example",
      theme: CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: CupertinoColors.activeGreen),
      home: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: CupertinoColors.systemGrey,
            middle: Text("Cupertino layout Demo!"),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Hello Cupertino Layout!!!")],
            ),
          )),
    );
  }
}
