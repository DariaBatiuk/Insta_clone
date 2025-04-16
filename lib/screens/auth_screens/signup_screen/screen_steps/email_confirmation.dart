import 'package:flutter/material.dart';
import 'package:flutter_course/screens/auth_screens/signup_screen/screen_steps/screen-step.dart';

class EmailConfirmationScreen extends StatelessWidget {
  const EmailConfirmationScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
          child: ScreenStep(
              headerText: "Enter the confirmation code",
              description: "To confirm your account, enter 6 digit code we sent to email@instagram.com",
              inputLabel: "Confirmation code",
              emailConfirmationStep: true,
              onNextBtnPressed: () => Navigator.pushNamed(context, '/create-password'),
          ),
      ),
      ),
    );
  }
}
