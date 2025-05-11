import 'package:flutter/material.dart';
import 'package:flutter_course/user-profile/user-profile.provider.dart';
import 'package:flutter_course/auth/auth.screens/login_screen.dart';
import 'package:flutter_course/auth/auth.screens/signup_email_screen.dart';
import 'package:flutter_course/home/home.screen.dart';

import 'package:provider/provider.dart';

import '../../user-profile/user-profile.dart';


/*This page managers how the user is routed to the appropriate screen based on their authentication & it is an entry point.
Go the signupPage: is user is not registered
Go to loginPage: if user is already registered
Go to homePage: is user is authenticated
 */

class AuthManagerScreen extends StatelessWidget {
  const AuthManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProfileProvider>(context);

    return StreamBuilder(
        stream: authProvider.userProfileStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final UserProfile? userAccount = snapshot.data;

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