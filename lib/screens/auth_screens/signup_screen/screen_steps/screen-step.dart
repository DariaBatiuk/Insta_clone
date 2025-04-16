import 'package:flutter/material.dart';
import '../../../../components/text_input_field.dart';
import '../../components/auth_screen_padding.dart';
import '../../constants.dart';

class ScreenStep extends StatelessWidget {
  final String headerText;
  final String description;
  final String inputLabel;
  final bool ? emailConfirmationStep;
  final Function() onNextBtnPressed;
  final Function() ? onResendConfirmationCodeButtonPressed;

  const ScreenStep({
    required this.headerText,
    required this.description,
    required this.inputLabel,
    this.emailConfirmationStep = false,
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
              SizedBox(height: authFormGapValue,),
              Text(description,
                style: TextStyle(fontSize: 12.0),),
              SizedBox(height: authFormGapValue,),
              TextInputField(label: inputLabel),
              SizedBox(height: authFormGapValue,),
              SizedBox(
                width: double.infinity,
                child:
                FilledButton(
                    onPressed: () => onNextBtnPressed(),
                    child: Text('Next')),
              ),
              SizedBox(height: authFormGapValue,),
              if (emailConfirmationStep == true)
              SizedBox(
                width: double.infinity,
                child:
                OutlinedButton(
                    onPressed: () => onResendConfirmationCodeButtonPressed,
                    child: Text("Didn't get the code?")),
              ),
              SizedBox(height: authFormGapValue,),

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
