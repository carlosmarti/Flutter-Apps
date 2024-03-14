import 'package:flutter/material.dart';
import 'package:riverpod_example/counterpage/counterpage.dart';

class Homepage extends StatelessWidget {
const Homepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body:  Center(
          child:
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Counterpage(),
                  ));
                }, 
                child: const Text("Go to Counter!")),
        ),
      );
  }
}