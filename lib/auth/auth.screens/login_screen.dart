import 'package:flutter/material.dart';
import 'package:flutter_course/app_routes.dart';
import 'package:flutter_course/user-profile/user-profile.provider.dart';
import 'package:flutter_course/app.components/text_input_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../auth.components/auth_screen_padding.dart';
import '../auth.constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginEmailController = TextEditingController();

  final TextEditingController _loginPasswordController = TextEditingController();

  bool _loading = false;

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
                            SizedBox(
                              height: AuthConstants.formGapValue,),
                            TextInputField(
                              label: ("Password"),
                              textEditingController: _loginPasswordController,
                              textInputType: TextInputType.text,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: AuthConstants.formGapValue,),
                            SizedBox(
                                width: double.infinity,
                                child: FilledButton(
                                    onPressed: () async {
                                      final email = _loginEmailController.text;
                                      final password = _loginPasswordController.text;

                                      if(email.isEmpty || password.isEmpty){
                                       return;
                                      }

                                      setState(() {
                                        _loading = true;
                                      });

                                      final authServiceResponse = await Provider.of<UserProfileProvider>(context, listen: false).loginWithEmailAndPassword(email, password);
                                      String? loginErrorMessage = authServiceResponse.errorMessage;

                                      if(loginErrorMessage != null){
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            backgroundColor: Colors.red.shade300,
                                            content: Text(loginErrorMessage)));
                                      } else {
                                        Navigator.pushNamed(context, AppRoutes.home);
                                      }

                                      setState(() {
                                        _loading = false;
                                      });

                                    },


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
                                child: Text('instagramclon',
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
