import 'package:flutter/material.dart';

/*This page managers how the user is routed to the appropriate screen based on their authentication & it is an entry point.
Go the signupPage: is user is not registered
Go to loginPage: if user is already registered
Go to homePage: is user is authenticated
 */

class AuthManagerScreen extends StatelessWidget {
  const AuthManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(body: Text('Entry')
      ),
    );
  }
}
