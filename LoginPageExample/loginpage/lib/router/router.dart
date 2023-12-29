import 'package:go_router/go_router.dart';
import 'package:loginpage/login/loginpage.dart';
import 'package:loginpage/registration/registrationpage.dart';
import 'package:loginpage/router/routerconstants.dart';
import 'package:loginpage/forgotpasspage/forgotpage.dart';
import 'package:loginpage/home/homepage.dart';

class AppRouter {
  final router = GoRouter(routes: [
    /* GoRoute(
      path: RouterConstants().home,
      builder: (context, state) => const HomePage(title: "Homepage"),
    ), */
    GoRoute(
      path: RouterConstants().loginpage,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RouterConstants().registerpage,
      builder: (context, state) => const RegistrationPage(),
    ),
    GoRoute(
      path: RouterConstants().forgotpage,
      builder: (context, state) => const ForgotPassPage(),
    )
  ]);
}
