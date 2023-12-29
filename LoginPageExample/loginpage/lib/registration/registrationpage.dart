// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loginpage/router/routerconstants.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Registration")
        ),
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 8.0, right: 8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "First Name"
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Last Name"
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email"
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: (){ context.go(RouterConstants().loginpage); },
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.lightBlue)),
                  child: Text('Register', style: TextStyle(color: Colors.white),)
                ),
              ),
            ],
          ),
        ) 
      ),
    );
  }
}
