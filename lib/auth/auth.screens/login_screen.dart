import 'package:flutter/material.dart';
import 'package:flutter_course/app_routes.dart';
import 'package:flutter_course/components/text_input_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../auth.components/auth_screen_padding.dart';
import '../auth.constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController = TextEditingController();

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
                            TextInputField(
                                label: "Username or email",
                                textEditingController: _loginEmailController,
                                textInputType: TextInputType.emailAddress,
                            ),
                            const SizedBox(
                              height: authFormGapValue,),
                            TextInputField(
                              label: ("Password"),
                              textEditingController: _loginPasswordController,
                              textInputType: TextInputType.text,
                              obscureText: true,
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
                                onPressed: () => Navigator.pushNamed(context, AppRoutes.signup),
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
