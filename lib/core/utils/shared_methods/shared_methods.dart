import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes/constants.dart';

// ============================ N A V I G A T I O N S ======================================

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (route) {
      return false;
    });

// =============================================================================================

// ============================ T O A S T ======================================

void showToast({
  required String text,
  required ToastStates state,
  ToastGravity toastGravity = ToastGravity.BOTTOM,
}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: toastGravity,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0.sp,
  );
}

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

// ============================================================================

Widget linearLoading(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 2, right: 2),
      child: LinearProgressIndicator(
        color: kLightBlue,
        backgroundColor: Colors.transparent,
        minHeight: MediaQuery.of(context).size.height * 0.004,
      ),
    );
