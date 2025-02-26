
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtons {
  static Widget iconWithLabel({
    String? label,
    IconData? icon,
    required Function onPressed,
    double width = 200,
  }) {
    return SizedBox(
      width: width.w,
      child: FilledButton.icon(
        onPressed: () => onPressed(),
        label: Text("$label"),
        icon: Icon(icon),
      ),
    );
  }
}
