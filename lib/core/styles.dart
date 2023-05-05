import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles {
  static TextStyle textStyleMedium20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyleBold24 = TextStyle(
    color: Colors.white,
    fontSize: 24.sp,
    letterSpacing: 1.5,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyleBold20 = const TextStyle(
    color: Colors.white,
    fontSize: 20,
    letterSpacing: 1.5,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textStyleSemiBold26 = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
  );
  static const textStyleMedium16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500
  );

  static const textStyle14 = TextStyle(
    fontSize: 14,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    // fontWeight: FontWeight.w500,
  );
}
