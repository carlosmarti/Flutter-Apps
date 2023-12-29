import 'package:flutter/material.dart';
import 'package:quizapp/models.dart';
import 'package:quizapp/services/firestore.dart';
import 'package:quizapp/shared/bottom_navbar.dart';
import 'package:quizapp/topics/topics_item.dart';
import 'package:quizapp/topics/drawer.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: FirestoreService().getTopics(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Create Loading Screen");
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Create Error Screen"),
          );
        } else if (snapshot.hasData) {
          var topics = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text("Topics"),
            ),
            body: GridView.count(
              primary: false,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              padding: const EdgeInsets.all(20.0),
              children: topics.map((topic) => TopicItem(topic: topic)).toList(),
            ),
            drawer: TopicDrawer(topics: topics),
            bottomNavigationBar: const BottomNavbar(),
          );
        }

        return const Center(child: Text('Something Went wrong!'),);
      }),
    );
  }
}
