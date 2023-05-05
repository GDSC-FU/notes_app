import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes/core/assets_data.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35, top: 10),
      child: SvgPicture.asset(AssetsData.login,
          height: MediaQuery.of(context).size.height * 0.25),
    );
  }
}
