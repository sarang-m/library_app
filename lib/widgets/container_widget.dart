import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Widget child;

  const ContainerWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(4.0, 4.0))
            ]),
        child: child);
  }
}
