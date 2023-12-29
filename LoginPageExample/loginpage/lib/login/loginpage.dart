// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:go_router/go_router.dart';
import 'package:loginpage/router/routerconstants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  "https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
              ),
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.only(left: 210, top: 8),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
              onTap: () => context.go(RouterConstants().forgotpage),
            ),
            ElevatedButton(
              onPressed: () => {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.lightBlue)),
              child: Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 10, right: 20),
                          child: Divider())),
                  Text("Sign in With"),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 20, right: 10),
                          child: Divider()))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  SignInButton(Buttons.Google, onPressed: () {}),
                  SignInButton(Buttons.Apple, onPressed: () {})
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90, top: 20),
              child: Row(
                children: [
                  Text("Don't have an account?"),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () { context.go(RouterConstants().registerpage);},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
