import 'package:flutter/material.dart';
import 'package:flutter_course/screens/auth_screens/signup_screen/screen_steps/screen-step.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ScreenStep(
          headerText: 'Create a password',
          description: "Create a password with at least 8 letters or numbers. It should be something others can't guess.",
          inputLabel: "Password",
          onNextBtnPressed: () => print('Call API')),
      ),
    );
  }
}