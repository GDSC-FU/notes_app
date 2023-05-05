import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/constants.dart';
import 'package:notes/features/splash/presentation/views/splash_view_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlue,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: kBlue,
        toolbarHeight: 0,
      ),
      body: const SplashBody(),
    );
  }
}
