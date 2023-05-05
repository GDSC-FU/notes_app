import 'package:flutter/material.dart';
import 'package:notes/core/utils/shared_widgets/custom_button.dart';
import 'package:notes/core/utils/shared_widgets/custom_text_button.dart';
import 'package:notes/features/login%20&%20registration/presentation/cubits/login_cubit.dart';

import '../../../../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(' Home screen'),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: CustomButton(
              text: 'SignOut',
              onPressed: () {
                LoginCubit.get(context).signOut(context);
              },
            ),
          ),
        ],
      )),
    );
  }
}
