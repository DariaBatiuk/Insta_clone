import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_course/app_theme_data.dart';
import 'package:flutter_course/screens/auth_screens/login_screen/screen.dart';
import 'package:flutter_course/screens/auth_screens/signup_screen/screen_steps/create_password.dart';
import 'package:flutter_course/screens/auth_screens/signup_screen/screen.dart';
import 'package:flutter_course/screens/auth_screens/signup_screen/screen_steps/email_confirmation.dart';

void main() {
  runApp(const InstagramClone());
}
class InstagramClone extends StatelessWidget {
  const InstagramClone({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "InstagramClone",
        theme: AppThemeData().light(),
        darkTheme: AppThemeData().dark(),
        themeMode: ThemeMode.light,
        routes: {
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/signup-email-confirmation': (context) => EmailConfirmationScreen(),
          '/create-password': (context) => CreatePasswordScreen(),
        },
        home: LoginScreen(),
    );
  }
}

