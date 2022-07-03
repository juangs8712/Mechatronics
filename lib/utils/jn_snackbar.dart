import 'package:flutter/material.dart';

class JnSnackBar {
  static void showSnackBar(BuildContext context, String strValue,
      {Duration? duration}) {
    final dispTime = duration ?? const Duration(milliseconds: 3500);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(strValue),
      duration: dispTime,
    ));
  }
}
