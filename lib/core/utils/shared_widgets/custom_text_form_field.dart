import 'package:flutter/material.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/styles.dart';
import 'package:notes/features/login%20&%20registration/presentation/cubits/login_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.validate,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.obscureText = false,
  });

  final String hintText;
  final Function validate;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPassword;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kBlue,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        hintText: hintText,
        hintStyle: Styles.textStyleMedium16.copyWith(
          color: kGrey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadius),
        ),
        enabledBorder: kInputBorder,
        focusedBorder: kInputBorder,
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(LoginCubit.get(context).passIcon),
                onPressed: () {
                  LoginCubit.get(context).changePasswordVisibility();
                },
              )
            : null,
      ),
      validator: (value) => validate(value),
    );
  }
}
