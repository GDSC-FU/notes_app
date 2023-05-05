import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/utils/shared_widgets/custom_button.dart';
import 'package:notes/features/login & registration/presentation/views/wigets/login_text_button.dart';
import 'package:notes/features/login & registration/presentation/views/wigets/registration_text_form_fields.dart';
import 'package:notes/features/login%20&%20registration/presentation/views/wigets/icon_buttons_row.dart';
import '../../../../../core/styles.dart';
import '../../../../../core/utils/shared_methods/shared_methods.dart';
import '../../cubits/login_cubit.dart';
import 'or_sign_in_row.dart';

class RegistrationBody extends StatelessWidget {
  const RegistrationBody({
    super.key,
    required this.userNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.formKey,
  });

  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is RegisterErrorState) {
          LoginCubit.get(context).handleAuthErrors(state.error);
        }
      },
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 45),
                Text(
                  'Create an account',
                  style: Styles.textStyleBold24.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 35),
                RegistrationTextFormFields(
                  userNameController: userNameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        !LoginCubit.get(context).registerLoading) {
                      LoginCubit.get(context).register(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        name: userNameController.text.trim(),
                        phone: phoneController.text.trim(),
                        context: context,
                      );
                    }
                  },
                ),
                if (LoginCubit.get(context).registerLoading)
                  linearLoading(context),
                const SizedBox(height: 20),
                const OrSignInRow(text: 'Or With'),
                const SizedBox(height: 20),
                const IconButtonsRow(),
                const SizedBox(height: 20),
                const LoginTextButton(),
                const SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }
}
