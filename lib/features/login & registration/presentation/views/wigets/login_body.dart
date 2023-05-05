import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/utils/shared_methods/shared_methods.dart';
import 'package:notes/core/utils/shared_widgets/custom_button.dart';
import 'package:notes/core/utils/shared_widgets/custom_text_button.dart';
import 'package:notes/core/utils/shared_widgets/custom_text_form_field.dart';
import 'package:notes/features/login & registration/presentation/views/wigets/login_image.dart';
import 'package:notes/features/login & registration/presentation/views/wigets/login_text.dart';
import 'package:notes/features/login%20&%20registration/presentation/views/wigets/icon_buttons_row.dart';
import 'package:notes/features/login%20&%20registration/presentation/views/wigets/or_sign_in_row.dart';
import 'package:notes/features/login%20&%20registration/presentation/views/wigets/sign_up_text_button.dart';

import '../../../../../core/styles.dart';
import '../../cubits/login_cubit.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginErrorState){
          LoginCubit.get(context).handleAuthErrors(state.error);
        }
      },
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const LoginImage(),
                const SizedBox(height: 20),
                const LoginText(),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'Email Address',
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  validate: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Enter your email address';
                    }
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'Password',
                  controller: passwordController,
                  isPassword: true,
                  obscureText: LoginCubit.get(context).obscureText,
                  validate: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Enter your password';
                    }
                  },
                ),
                CustomTextButton(
                  text: 'Forgot Password ?',
                  textStyle: Styles.textStyleMedium16.copyWith(color: kGrey),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    if (formKey.currentState!.validate() && ! LoginCubit.get(context).loginLoading) {
                      LoginCubit.get(context).login(email: emailController.text.trim(), password: passwordController.text.trim() , context: context);
                    }
                  },
                ),
                if(LoginCubit.get(context).loginLoading)
                linearLoading(context),
                const SizedBox(height: 20),
                const OrSignInRow(),
                const SizedBox(height: 10),
                const IconButtonsRow(),
                const SizedBox(height: 10),
                const SignUpTextButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
