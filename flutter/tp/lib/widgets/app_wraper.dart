import 'package:flutter/material.dart';

class AppWrapper extends StatelessWidget {
  final Widget child;

  AppWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: child,
    );
  }
}
