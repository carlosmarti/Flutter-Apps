// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loginpage/router/routerconstants.dart';
import 'package:loginpage/authentication/authenticator.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _formstate = GlobalKey<FormState>();

  void registerUser(String email, String password){

    Authenticator().createUser(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Registration")
        ),
      ),
      body:  Form(
        key: _formstate,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 8.0, right: 8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "First Name"
                  ),
                  validator: (value){
                    if(value!.isEmpty || value == null){
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Last Name"
                    ),
                    validator: (value){
                      if(value!.isEmpty || value == null){
                        return 'Please enter a value';
                      }
                      return null;
                    },
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email"
                  ),
                  validator: (value){
                    if(value!.isEmpty || value == null){
                      return 'Please enter a value';
                    }
                    return null;
                  },
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
      ),
    );
  }
}
