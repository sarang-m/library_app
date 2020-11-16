import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_app/screens/error/routing_error.dart';
import 'package:library_app/screens/firebase/firebase.dart';
import 'package:library_app/screens/home/home.dart';
import 'package:library_app/screens/login/login_screen.dart';
import 'package:library_app/screens/signup/signup_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //for passing arguments
    //final arguments = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case "/signup":
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case "/firebase":
        return MaterialPageRoute(builder: (context) => FirebaseScreen());
      case "/home":
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => RoutingError());
    }
  }
}
