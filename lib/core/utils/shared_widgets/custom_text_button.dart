import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const   CustomTextButton({
    super.key,
    required this.text,
    required this.onTap, required this.textStyle,
  });

  final String text;
  final void Function() onTap;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
