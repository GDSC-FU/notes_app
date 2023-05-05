import 'package:flutter/material.dart';
import 'package:notes/features/login%20&%20registration/presentation/views/wigets/login_background_image.dart';
import 'package:notes/features/login%20&%20registration/presentation/views/wigets/registration_body.dart';

import '../../../../constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          children: [
            const LoginBackgroundImage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: RegistrationBody(
                      userNameController: userNameController,
                      emailController: emailController,
                      phoneController: phoneController,
                      passwordController: passwordController,
                      formKey: formKey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
