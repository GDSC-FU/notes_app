import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/core/assets_data.dart';

class IconButtonsRow extends StatelessWidget {
  const IconButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AssetsData.google, height: 45),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AssetsData.facebook, height: 45),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AssetsData.apple, height: 45),
        ),
      ],
    );
  }
}
