import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_course/auth/auth.screens/auth_manager.screen.dart';
import 'package:flutter_course/auth/auth.screens/login_screen.dart';
import 'package:flutter_course/auth/auth.screens/signup_email_screen.dart';
import 'package:flutter_course/auth/auth.screens/signup_password_screen.dart';
import 'package:flutter_course/home/home.screen.dart';

import 'auth/auth.screens/signup_email_confirmation_screen.dart';

class AppRoutes {
  static const String signup = '/signup';
  static const String signupOtpEmail = 'signup-otp-email';
  static const String signupPassword = '/signup-password';
  static const String login = '/login';
  // static const String signupEmailConfirmation = '/signup-email-confirmation';
  static const home = '/home';

  static const Widget entryScreen = AuthManagerScreen();
  static Map<String, WidgetBuilder>getRoutes() {
    return{
      signup: (context) => SignupEmailScreen(),
      signupOtpEmail:(context) => SignupEmailOtpScreen(),
      signupPassword: (context) => SignupPasswordScreen(),
      login: (context) => LoginScreen(),
      home: (context) => HomeScreen()
    };
  }
}
