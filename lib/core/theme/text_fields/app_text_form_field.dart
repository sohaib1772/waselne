import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    super.key,
    this.isPassword = false,
    this.showPassword = false,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.width = double.infinity,
    required this.validator,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.onChange,
    this.initValue
  });

  bool isPassword;
  bool showPassword;
  TextEditingController controller;
  String hintText;
  IconData? prefixIcon;
  Widget? suffixIcon;
  TextInputAction textInputAction;
  double width;
  TextInputType keyboardType;
  FormFieldValidator validator;
  Function? onChange;
  String? initValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hintText, style: AppTextStyle.white14W500),
          SizedBox(height: 5.h),
          TextFormField(
            onChanged: onChange == null ? null : (text) => onChange!(text),
            controller: controller,
            textInputAction: textInputAction,
            validator: validator,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 5.h,
              ),

              suffixIcon: suffixIcon,
              hintText: hintText,
              prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            ),
            obscureText: showPassword,
          ),
        ],
      ),
    );
  }
}
