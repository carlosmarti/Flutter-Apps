// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:go_router/go_router.dart';
import 'package:loginpage/home/homepage.dart';
import 'package:loginpage/router/routerconstants.dart';
import 'package:loginpage/authentication/authenticator.dart';
import 'package:loginpage/shared/loading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formState = GlobalKey<FormState>();

  late String email;
  late String password;

  Future<void> userSignIn(String email, String password) async{

    String message = await Authenticator().signinUser(email, password);
    if(message != 'invalid-credential'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Credentials were not correct Please try again!')));
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
    return StreamBuilder(
      stream: Authenticator().userStream,
      builder: (context, snapshot){

        if(snapshot.connectionState == ConnectionState.waiting){
          return const LoadingPage();
        }
        else if(snapshot.hasError){
          return const Text("Error");
        }
        else if(snapshot.hasData){
          return HomePage(title: "Home");
        }

        return Scaffold(
          appBar: AppBar(),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Form(
              key: _formState,
              child: Center(
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
                      child: TextFormField(
                        onSaved: (value) {email = value.toString();},
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email",
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
                      padding: EdgeInsets.only(top: 8, left: 30, right: 30),
                      child: TextFormField(
                        onSaved: (newValue) => password = newValue.toString(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                        ),
                        validator: (value){
                          if(value!.isEmpty || value == null){
                            return 'Please enter a value';
                          }
                          return null;
                        },
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
                      onPressed: (){
            
                        if(_formState.currentState!.validate()){
            
                          _formState.currentState!.save();
            
                          if(checkEmailCorrectness(email)){
                            userSignIn(email, password);
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please use a Yahoo, Google, or Outlook email!')));
                          }
                          
                        }
                      },
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
            ),
          ),
        );
      }
    );
  }
}
