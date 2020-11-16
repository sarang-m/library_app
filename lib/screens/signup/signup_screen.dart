import 'package:flutter/material.dart';
import 'package:library_app/screens/signup/local_widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  static String tag = "/signup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Center(child: SignUpForm()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
