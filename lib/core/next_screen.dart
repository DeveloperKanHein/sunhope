import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void nextStlScreen(
    {required BuildContext context, required StatelessWidget screen}) {
  Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeft,
          // duration: const Duration(milliseconds: ConstValues.routeDuration),
          child: screen));
}

void nextStfScreen(
    {required BuildContext context, required StatefulWidget screen}) {
  Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeft,
          // duration: const Duration(milliseconds: ConstValues.routeDuration),
          child: screen));
}

void screenReplace(
    {required BuildContext context, required StatefulWidget screen}) {
  Navigator.pushReplacement(
      context,
      PageTransition(
          type: PageTransitionType.rightToLeft,
          // duration: const Duration(milliseconds: ConstValues.routeDuration),
          child: screen));
}
