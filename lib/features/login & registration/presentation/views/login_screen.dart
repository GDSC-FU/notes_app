import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/assets_data.dart';
import 'package:notes/features/login%20&%20registration/presentation/views/wigets/login_background_image.dart';
import 'package:notes/features/login%20&%20registration/presentation/views/wigets/login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                    child: LoginBody(
                      emailController: emailController,
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
