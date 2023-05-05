import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes/core/assets_data.dart';

class LoginBackgroundImage extends StatelessWidget {
  const LoginBackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsData.background,
      // alignment: Alignment.bottomLeft,
      alignment: const Alignment(500, 1.05),
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}
