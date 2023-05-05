import 'package:flutter/material.dart';

import '../../../../core/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) => SlideTransition(
        position: slidingAnimation,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Hello, ',
            style: Styles.textStyleBold20,
            children: [
              TextSpan(
                text: ' welcome in \nSAVE NOTES app',
                style: Styles.textStyleBold20.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
