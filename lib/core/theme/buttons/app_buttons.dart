import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtons {
  static Widget iconWithLabel({
    String? label,
    IconData? icon,
    required Function onPressed,
    double width = 200,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return SizedBox(
      width: width.w,
      child: FilledButton.icon(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          ),
          backgroundColor:
              backgroundColor != null
                  ? WidgetStatePropertyAll(backgroundColor)
                  : null,
        ),
        onPressed: () => onPressed(),
        label: Text(
          "$label",
          style: TextStyle(
            color: textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(icon, color: textColor),
      ),
    );
  }

  static Widget normalButton({
    String? label,
    required Function onPressed,
    double width = 200,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
  }) {
    return SizedBox(
      width: width.w,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
          textStyle: WidgetStatePropertyAll(TextStyle(color: textColor)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),side: BorderSide(color: borderColor ?? Colors.transparent,width: 1)),
          ),
        ),
        onPressed: () => onPressed(),
        child: Text("$label"),
      ),
    );
  }
}
