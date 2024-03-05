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

  late String email;
  late String password;

  Future<void> registerUser(String email, String password) async{

    String authMessage = await Authenticator().createUser(email, password);

    if(authMessage != 'success'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authMessage)));
    }
  }

  bool checkEmailCorrectness(String em){

    final emailSplit = em.split('@');

    if(emailSplit[1] == 'yahoo.com' || emailSplit[1] == 'gmail.com' || emailSplit[1] == 'outlook.com'){
      return true;
    }
    return false;
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
                  onSaved: (newvalue) => email = newvalue.toString(),
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
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextFormField(
                    obscureText: true,
                    onSaved: (newValue) => password = newValue.toString(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password"
                    ),
                    validator: (value){
                      if(value!.isEmpty || value == null){
                        return 'Please enter a value';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: (){ 

                      if(_formstate.currentState!.validate()){

                        _formstate.currentState!.save();

                        if(checkEmailCorrectness(email)){
                          registerUser(email, password);
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please use an email from yahoo, gmail, or outlook!')));
                        }
                      }
                      
                    },
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
