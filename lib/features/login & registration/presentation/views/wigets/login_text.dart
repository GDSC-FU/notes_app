import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';

class LoginText extends StatelessWidget {
  const LoginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        'Login',
        style: Styles.textStyleMedium20,
      ),
    );
  }
}
