import 'package:flutter/material.dart';

class RoutingError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Routing Error",
          style: TextStyle(
              fontSize: 25, color: Theme.of(context).secondaryHeaderColor),
        ),
      ),
    );
  }
}
