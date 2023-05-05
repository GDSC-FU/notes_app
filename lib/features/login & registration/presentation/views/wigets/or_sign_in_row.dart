import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

import '../../../../../core/styles.dart';

class OrSignInRow extends StatelessWidget {
  const OrSignInRow({
    super.key,
     this.text = 'Or Sign up With',
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SizedBox(
            // width: width * 0.3,
            height: 2,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    kBlue,
                    const Color(0xffC4C4C400).withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: Styles.textStyleMedium16.copyWith(color: kDarkGrey , fontSize: 12),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 2,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    kBlue,
                    const Color(0xffC4C4C400).withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
