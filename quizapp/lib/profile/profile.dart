import 'package:flutter/material.dart';
import 'package:quizapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/models.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var report = Provider.of<Report>(context);
    var user = AuthService().user;

    if(user != null){
      return Scaffold(
      appBar: AppBar(title: Text(user.displayName ?? 'Guest')),
      body: Container(),
    );
    }
    
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ElevatedButton(
        child: const Text('Sign Out'), 
        onPressed: () async {
          AuthService().signOut(); 
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          },
        ),
    );
  }
}