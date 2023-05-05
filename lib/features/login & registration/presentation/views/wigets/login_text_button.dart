import 'package:flutter/material.dart';
import 'package:notes/core/utils/shared_methods/shared_methods.dart';
import 'package:notes/features/login%20&%20registration/presentation/views/login_screen.dart';
import 'package:notes/features/login%20&%20registration/presentation/views/registration_screen.dart';

import '../../../../../constants.dart';
import '../../../../../core/styles.dart';
import '../../../../../core/utils/shared_widgets/custom_text_button.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account ?',
          style: Styles.textStyleMedium16.copyWith(
            color: Colors.black.withOpacity(0.8),
            decoration: TextDecoration.underline,
          ),
        ),
        CustomTextButton(
          text: 'Login',
          textStyle: Styles.textStyleMedium16.copyWith(
            color: kLightBlue,
            decoration: TextDecoration.underline,
            decorationColor: kLightBlue,
          ),
          onTap: () {
            navigateAndFinish(context, const LoginScreen());
          },
        ),
      ],
    );
  }
}
