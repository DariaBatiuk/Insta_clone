import 'package:flutter/material.dart';
import 'package:flutter_course/screens/auth_screens/signup_screen/screen_steps/screen-step.dart';

class EmailInputScreen extends StatelessWidget {
  const EmailInputScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ScreenStep(
        headerText: "What's your email?",
        description: 'Enter the email where you can be contacted. No one will see this on your profile.',
        inputLabel: 'Email',
        onNextBtnPressed:
            () => Navigator.pushNamed(
                context, '/signup-email-confirmation'),
      ),
      ),
    );
  }
}
