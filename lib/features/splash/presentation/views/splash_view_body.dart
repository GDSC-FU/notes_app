import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/utils/shared_methods/shared_methods.dart';
import 'package:notes/features/home/presentation/views/home_screen.dart';
import 'package:notes/features/login%20&%20registration/presentation/views/login_screen.dart';
import 'package:notes/features/splash/presentation/views/sliding_text.dart';

import '../../../../core/assets_data.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.15),
        SvgPicture.asset(AssetsData.splash),
        const SizedBox(height: 50),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .15),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 30),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });
  }

  Future navigateToHome() {
    return Future.delayed(const Duration(seconds: 2), () {
      print('Current user id = $uId');
      navigateAndFinish(
          context, uId == '' ? const LoginScreen() : const HomeScreen());
    });
  }
}
