import 'package:quizapp/home/home.dart';
import 'package:quizapp/about/about.dart';
import 'package:quizapp/login/login.dart';
import 'package:quizapp/profile/profile.dart';
import 'package:quizapp/topics/topics.dart';
import 'package:quizapp/quiz/quiz.dart';


var approute = {
  '/': (context) => const HomeScreen(),
  '/about': (context) => const AboutScreen(),
  '/login': (context) => const LoginScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/quiz': (context) => const QuizScreen(),
};