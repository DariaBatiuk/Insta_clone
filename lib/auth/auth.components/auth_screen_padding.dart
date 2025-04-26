import 'package:flutter/material.dart';

class AuthScreenPadding extends StatelessWidget {
  final Widget child;
  const AuthScreenPadding({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: child
    );
  }
}