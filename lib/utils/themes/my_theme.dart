import 'package:flutter/material.dart';
import 'package:library_app/utils/themes/constants.dart';

class MyTheme {
  ThemeData buildTheme() {
    return ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: lightGreen,
        primaryColor: lightGreen,
        accentColor: darkGray,
        secondaryHeaderColor: darkGray,
        textTheme: TextTheme(
          headline1: TextStyle().copyWith(fontSize: 100, color: Colors.red),
        ),
        hintColor: lightGray);
  }

  final KHeadingTextStyle = TextStyle(
      //fontSize:SizeConfig.safeBlockHorizontal*6,
      fontSize: 10,
      color: ThemeData().secondaryHeaderColor,
      fontWeight: FontWeight.bold);
}
