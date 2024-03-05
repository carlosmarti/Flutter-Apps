// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:loginpage/authentication/authenticator.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  void signout(){
    Authenticator().signUserOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Text('Menu'),
          ),
          ListTile(
            title: Text('Sign Out'),
            onTap: () => signout(),
          )
        ],
      ),
    );
  }
}
