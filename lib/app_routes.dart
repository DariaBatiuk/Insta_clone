import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_course/auth/auth.screens/auth_manager.screen.dart';
import 'package:flutter_course/auth/auth.screens/login_screen.dart';
import 'package:flutter_course/auth/auth.screens/signup_email_screen.dart';
import 'package:flutter_course/auth/auth.screens/signup_password_screen.dart';
import 'package:flutter_course/home/home.screen.dart';
import 'package:flutter_course/posts/posts.screen.dart';
import 'package:flutter_course/search/search.screen.dart';
import 'package:flutter_course/user-profile/user_profile.screen.dart';
import 'package:flutter_course/videos/videos.screen.dart';

import 'auth/auth.screens/signup_email_otp_screen.dart';

class AppRoutes {
  static const String signup = '/signup';
  static const String signupOtpEmail = 'signup-otp-email';
  static const String signupPassword = '/signup-password';
  static const String login = '/login';
  // static const String signupEmailConfirmation = '/signup-email-confirmation';
  static const String home = '/home';
  static const String search = '/search';
  static const String posts = '/posts';
  static const String videos = '/videos';
  static const String userProfile = '/userProfile';


  static const Widget entryScreen = AuthManagerScreen();
  static Map<String, WidgetBuilder>getRoutes() {
    return{
      signup: (context) => SignupEmailScreen(),
      signupOtpEmail:(context) => SignupEmailOtpScreen(),
      signupPassword: (context) => SignupPasswordScreen(),
      login: (context) => LoginScreen(),
      search: (context) => SearchScreen(),
      posts: (context) => PostsScreen(),
      videos: (context) => VideosScreen(),
      userProfile: (context) => UserProfileScreen(),
      home: (context) => HomeScreen()
    };
  }
}
