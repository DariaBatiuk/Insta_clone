import 'package:flutter/material.dart';
import 'package:flutter_course/components/text_input_field.dart';
import 'package:flutter_course/screens/auth_screens/components/auth_screen_padding.dart';
import 'package:flutter_course/screens/auth_screens/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Center(
                  child: SvgPicture.asset("assets/app_logos/instagramClone_logo.svg")),
              ),
              Flexible(
                  child: AuthScreenPadding(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const TextInputField(
                                    label: "Username or email"
                                    ),
                            const SizedBox(
                              height: authFormGapValue,),
                            const TextInputField(
                                    label: ("Password"),
                                    ),
                            const SizedBox(
                              height: authFormGapValue,),
                            SizedBox(
                              width: double.infinity,
                                child: FilledButton(
                                    onPressed: () => print("Login clicked"),
                                    child: Text("Login"))
                            ),
                            TextButton(onPressed: () => print("Forgot password?"), child: Text("Forgot password"))
                          ],
                        ),
                        Column(
                          children: [
                            OutlinedButton(
                              onPressed: () => Navigator.pushNamed(context, '/signup'),
                              child: Text("Create new account")
                            ),
                            TextButton(onPressed: () => print('Clicked!'),
                                child: Text('canshecode',
                                  style: Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? const TextStyle(color: Colors.white54)
                                      : const TextStyle(color: Colors.black54))
                            )
                          ],
                        )
                      ],
                    ),
                  )
                    
              )
            ],
          ),

      )
    );
  }
}
