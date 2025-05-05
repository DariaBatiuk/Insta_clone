import 'package:flutter/material.dart';
import 'package:flutter_course/auth/auth.provider.dart';
import 'package:flutter_course/auth/auth.screens/login_screen.dart';
import 'package:flutter_course/auth/auth.screens/signup_email_screen.dart';
import 'package:flutter_course/home/home.screen.dart';

import 'package:flutter_course/user-account/user-account.model.dart';
import 'package:provider/provider.dart';

import 'package:flutter_course/app_routes.dart';


/*This page managers how the user is routed to the appropriate screen based on their authentication & it is an entry point.
Go the signupPage: is user is not registered
Go to loginPage: if user is already registered
Go to homePage: is user is authenticated
 */

class AuthManagerScreen extends StatelessWidget {
  const AuthManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return StreamBuilder(
        stream: authProvider.userAccountStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final UserAccountModel? userAccount = snapshot.data;

            if (userAccount == null) {
              return authProvider.hasSigneUpBefore
                  ? LoginScreen()
                  : SignupEmailScreen();
            }
            return const HomeScreen();
          }
          return const Scaffold(
              body: Center(
                  child: CircularProgressIndicator()
              )
          );
        }
    );
  }
}