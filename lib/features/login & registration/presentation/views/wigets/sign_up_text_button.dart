import 'package:flutter/material.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/utils/shared_widgets/custom_text_button.dart';
import 'package:notes/features/login%20&%20registration/presentation/views/login_screen.dart';

import '../../../../../core/styles.dart';
import '../../../../../core/utils/shared_methods/shared_methods.dart';
import '../registration_screen.dart';

class SignUpTextButton extends StatelessWidget {
  const SignUpTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account ?',
          style: Styles.textStyleMedium16.copyWith(
            color: Colors.black.withOpacity(.8),
            decoration: TextDecoration.underline,
          ),
        ),
        CustomTextButton(
          text: 'Sign Up',
          textStyle: Styles.textStyleMedium16.copyWith(
            color: kLightBlue,
            decoration: TextDecoration.underline,
            decorationColor: kLightBlue,
          ),
          onTap: () {
            navigateAndFinish(context, const RegistrationScreen());
          },
        ),
      ],
    );
  }
}
