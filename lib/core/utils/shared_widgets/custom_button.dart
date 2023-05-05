import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/constants.dart';

import '../../styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      color: kBlue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(kRadius)),
      ),
      highlightColor: kBlue,
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.textStyleBold24,
      ),
    );
  }
}
