import 'package:flutter/material.dart';
import 'package:flutter_course/app_routes.dart';
import 'package:flutter_course/auth/auth.service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Home Screen'),
              ElevatedButton(
                  onPressed: () {
                    _authService.logout();
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  }, child: Text('Logout'),)
            ],
          )
        )
      ),
    );
  }
}
