import 'package:flutter/material.dart';
import '../../../../app.components/text_input_field.dart';
import '../auth.constants.dart';
import 'auth_screen_padding.dart';


class SignupScreenWrapper extends StatelessWidget {
  final String headerText;
  final String description;
  final String inputLabel;
  final TextInputField textInputField;
  final bool ? emailConfirmationStep;
  final bool loading;
  final String? errorMessage;
  final Function() onNextBtnPressed;
  final Function() ? onResendConfirmationCodeButtonPressed;

  const SignupScreenWrapper({
    required this.headerText,
    required this.description,
    required this.inputLabel,
    required this.textInputField,
    this.emailConfirmationStep = false,
    this.loading = false,
    this.errorMessage,
    required this.onNextBtnPressed,

    this.onResendConfirmationCodeButtonPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AuthScreenPadding(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.0,),
              Text(headerText,
                style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: AuthConstants.formGapValue,),
              Text(description,
                style: TextStyle(fontSize: 12.0),),
              SizedBox(height: AuthConstants.formGapValue,),
              textInputField,
              if(errorMessage != null)
                Text(errorMessage!, style: TextStyle(color: Colors.red)),

              SizedBox(height: AuthConstants.formGapValue,),
              loading ?
              Center(child: CircularProgressIndicator(strokeWidth: 4.0,)) :
              SizedBox(
                width: double.infinity,
                child:
                FilledButton(
                    onPressed: () => onNextBtnPressed(),
                    child: Text('Next')),
              ),
              SizedBox(height: AuthConstants.formGapValue,),
              if (emailConfirmationStep == true)
                SizedBox(
                  width: double.infinity,
                  child:
                  OutlinedButton(
                      onPressed: () => onResendConfirmationCodeButtonPressed,
                      child: Text("Didn't get the code?")),
                ),
              SizedBox(height: AuthConstants.formGapValue,),

            ],
          ),
          TextButton(
              onPressed: () => Navigator.popAndPushNamed(context, '/login'),
              child: Text("Already have an account"))
        ],
      ),
    );
  }
}
