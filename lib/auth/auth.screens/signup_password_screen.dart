import 'package:flutter/material.dart';
import 'package:flutter_course/app_routes.dart';
import 'package:flutter_course/auth/auth.components/signup_screen_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_course/auth/auth.provider.dart';

import '../../components/text_input_field.dart';

class SignupPasswordScreen extends StatefulWidget {
  SignupPasswordScreen({super.key});

  @override
  State<SignupPasswordScreen> createState() => _SignupPasswordScreenState();
}

class _SignupPasswordScreenState extends State<SignupPasswordScreen>{
  final TextEditingController _signupPasswordController = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SignupScreenWrapper(
          headerText: 'Create a password',
          textInputField: TextInputField(
            textInputType: TextInputType.text,
            obscureText: true,
            label: ("Password"),
            textEditingController: _signupPasswordController
          ),
          loading: _loading,
          description: "Create a password with at least 8 letters or numbers. It should be something others can't guess.",
          inputLabel: "Password",
          onNextBtnPressed: ()async {
            final password = _signupPasswordController.text;
            if(password.isEmpty){
              return;
            }
            setState(() {
              _loading = true;
            });

            final success = await Provider.of<AuthProvider>(context, listen: false).signupWithEmailAndPassword(password);
            if (success){
              Navigator.pushNamed(context, AppRoutes.home);
            }
            setState(() {
              _loading = false;
            });
          }
        ),
      ),
    );
  }
}