import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:library_app/screens/firebase/firebase.dart';
import 'package:library_app/utils/route_generator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:library_app/utils/themes/my_theme.dart';
import 'package:connectivity/connectivity.dart';

void main() {
  runApp(DevicePreview(
    builder: (context)=> MyApp(),
    enabled: kReleaseMode,
  ),);
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library App',
      theme: MyTheme().buildTheme(),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: FirebaseScreen.tag,
    );
  }
}
