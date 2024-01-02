import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.error = "Something went Wrong!"});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Center(
          child: Column(children: [
            Text(error),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(children: [
                ElevatedButton(
                  onPressed: () {}, 
                  child: const Text("Sign Up")
                ),
                Row(
                children:[
                  Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 20),
                      child: const Divider(),
                      ),
                  ),
                  const Text("Or"),
                  Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 10),
                      child: const Divider(),
                    ),
                  ),
                ],),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Go Back")
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
