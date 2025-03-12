
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtons {
  static Widget iconWithLabel({
    String? label,
    IconData? icon,
    required Function onPressed,
    double width = 200,
    Color? backgroundColor,
  }) {
    return SizedBox(
      width: width.w,
      child: FilledButton.icon(
        style: ButtonStyle(backgroundColor: backgroundColor != null ? WidgetStatePropertyAll(backgroundColor) : null),
        onPressed: () => onPressed(),
        label: Text("$label"),
        icon: Icon(icon),
      ),
    );
  }
  static Widget normalButton({
    String? label,
    required Function onPressed,
    double width = 200,
  }) {
    return SizedBox(
      width: width.w,
      child: FilledButton(
        onPressed: () => onPressed(),
        child: Text("$label"),
      ),
    );
  }
}
