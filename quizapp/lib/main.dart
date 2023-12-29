import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/firebase_options.dart';
import 'package:quizapp/routes.dart';
import 'package:quizapp/services/firestore.dart';
import "package:quizapp/theme.dart";
import 'package:quizapp/models.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _initialization, builder: (context, snapshot){

      if(snapshot.hasError){
        return const Text("Error", textDirection: TextDirection.ltr,);
      }

      if(snapshot.connectionState == ConnectionState.done){
        return StreamProvider(
          create: (_) => FirestoreService().streamReport(),
          initialData: Report(),
          child: MaterialApp(
            theme: apptheme,
            routes: approute,
          ),
        );
      }

      return const Text('Loading', textDirection: TextDirection.ltr,);
    });
  }
}