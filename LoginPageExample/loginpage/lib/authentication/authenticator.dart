import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticator{

  late FirebaseAuth firebaseInstance = FirebaseAuth.instance;
  final userStream = FirebaseAuth.instance.authStateChanges();

  Authenticator();

  void createUser(String email, String password){

    try{
      firebaseInstance.createUserWithEmailAndPassword(
        email: email,
        password: password);
    }
    on FirebaseAuthException catch(e){
      print(e.message);
    }
  }

  Future<String> signinUser(String email, String password) async{

    try{
      await firebaseInstance.signInWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch(e){
      return e.code;
    }

    return "success";
  }
}