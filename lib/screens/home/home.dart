import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String tag = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
        child: Text("home"),
      ),
    );
  }
}
