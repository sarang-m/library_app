import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_app/screens/login/local_widgets/login_form.dart';
import 'package:library_app/utils/screen_size.dart';

class LoginScreen extends StatelessWidget {
  final FirebaseAuth auth;
  LoginScreen({this.auth});
  static String tag = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset("assets/logo.png"),
                ),
                LoginForm(auth: auth,),

              ],
            ),
          )
        ],
      ),
    );
  }
}
