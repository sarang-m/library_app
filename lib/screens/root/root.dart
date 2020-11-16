import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_app/screens/home/home.dart';
import 'package:library_app/screens/login/login_screen.dart';
import 'package:library_app/services/auth.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth(auth: _auth).user,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data?.uid == null) {
            //login screen
            return LoginScreen(auth: _auth,);
          } else {
            //home screen
            return HomeScreen();
          }
        }else{
          return Scaffold(body: Center(child: Text("Loading..."),),);
        }
      },
    );
  }
}
