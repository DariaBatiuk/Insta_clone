import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_course/app_routes.dart';
import 'package:flutter_course/auth/auth.components/signup_screen_wrapper.dart';
import 'package:flutter_course/auth/auth.provider.dart';
import 'package:flutter_course/components/text_input_field.dart';
import 'package:provider/provider.dart';

class SignupEmailOtpScreen extends StatelessWidget {
  SignupEmailOtpScreen ({super.key});

  final TextEditingController _signupOtpController = TextEditingController();

  Future<void> _sendEmailWithOtp(String email, String otp) async {
    try {
      final emailResponse = await http.post(
        Uri.parse("https://pwt3i3mzcm.us-east-1.awsapprunner.com/api/v1/email/test"),
        headers: {"Content-Type": "application/json", "apiKey": "G3WM69SDmhCYkEZw2Ty7sn"},
        body: jsonEncode({
          "fromName": "Instagram Clone",
          "subject": "Email verification OTP",
          "toEmail": email,
          "bodyText": "Your OTP for verification is $otp",
        })
      );
      if(emailResponse.statusCode != 200) {
        throw Exception("Failed to send an email");
      }
    } catch(error) {
      throw Exception("Failed to send an email");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Provider(
          create: (context) => AuthProvider(),
          child: SignupScreenWrapper(
            headerText: "Enter the OTP sent to your email",
            description: 'An OTP has been sent to your email. Enter it here to verify your email.',
            textInputField: TextInputField(
                textEditingController: _signupOtpController,
                label: "OTP", textInputType: TextInputType.number
            ),
            inputLabel: 'Email',
            onNextBtnPressed: () {
              final email = _signupOtpController.text.trim();
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

