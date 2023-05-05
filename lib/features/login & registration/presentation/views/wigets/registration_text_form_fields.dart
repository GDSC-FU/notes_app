import 'package:flutter/material.dart';
import 'package:notes/core/utils/shared_widgets/custom_text_form_field.dart';

import '../../cubits/login_cubit.dart';

class RegistrationTextFormFields extends StatelessWidget {
  const RegistrationTextFormFields({
    super.key,
    required this.userNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
  });

  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'User name',
          validate: (String value) {
            if (value.trim().isEmpty) {
              return 'Enter your user name';
            }
          },
          controller: userNameController,
        ),
        const SizedBox(height: 15),
        CustomTextFormField(
          hintText: 'Email Address',
          validate: (String value) {
            if (value.trim().isEmpty) {
              return 'Enter your email address';
            }
          },
          controller: emailController,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 15),
        CustomTextFormField(
          hintText: 'Phone',
          validate: (String value) {
            if (value.trim().isEmpty) {
              return 'Enter your phone';
            }
          },
          controller: phoneController,
          textInputType: TextInputType.phone,
        ),
        const SizedBox(height: 15),
        CustomTextFormField(
          hintText: 'Password',
          isPassword: true,
          obscureText: LoginCubit.get(context).obscureText,
          validate: (String value) {
            if (value.trim().isEmpty) {
              return 'Enter your password';
            }
          },
          controller: passwordController,
        ),
      ],
    );
  }
}
