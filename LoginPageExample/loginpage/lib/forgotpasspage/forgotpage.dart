// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loginpage/router/routerconstants.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({super.key});

  void submitted(context){
    const snack = SnackBar(content: Text('Submit Button pressed'));

    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Forgot Password')),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Enter the email associated with your account. If there is an account associated with the given email a reset password will be send to your email.'),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      submitted(context);
                      context.go(RouterConstants().loginpage);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue
                    ),
                    child: Text("Submit", style: TextStyle(color: Colors.white),)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
