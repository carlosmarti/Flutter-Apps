import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticator{

  late FirebaseAuth firebaseInstance = FirebaseAuth.instance;
  final userStream = FirebaseAuth.instance.authStateChanges();

  Authenticator();

  Future<String> createUser(String email, String password) async{

    try{
      await firebaseInstance.createUserWithEmailAndPassword(
        email: email,
        password: password);
    }
    on FirebaseAuthException catch(e){
      return e.code;
    }

    return 'success';
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

  Future<void> signUserOut() async{
    try{
      await firebaseInstance.signOut();
    }
    on FirebaseAuthException catch (e){
      print(e.code);
    }
  }

  
}