import 'package:flutter/material.dart';
import 'package:flutter_course/app_routes.dart';
import 'package:flutter_course/auth/auth.components/signup_screen_wrapper.dart';
import 'package:flutter_course/auth/auth.provider.dart';
import 'package:flutter_course/components/text_input_field.dart';
import 'package:provider/provider.dart';

class SignupEmailScreen extends StatefulWidget {
  const SignupEmailScreen ({super.key});

  @override
  State<SignupEmailScreen> createState() => _SignupEmailScreenState();
}

class _SignupEmailScreenState extends State<SignupEmailScreen> {
  final TextEditingController _signupEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Provider(
          create: (context) => AuthProvider(),
          child: SignupScreenWrapper(
          headerText: "What's your email?",
          description: 'Enter the email where you can be contacted. No one will see this on your profile.',
          textInputField: TextInputField(
            textEditingController: _signupEmailController,
            label: "Email", textInputType: TextInputType.text
          ),
          inputLabel: 'Email',
          onNextBtnPressed: () {
            final email = _signupEmailController.text.trim();
            if(email.isNotEmpty) {
              context.read<AuthProvider>().setEmail(email);
              Navigator.pushNamed(context, AppRoutes.signupPassword);
            }
            print("Go to password screen.");
          },
                ),
        ),
      ),
    );
  }
}

