import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
   AppTextFormField({super.key, this.isPassword = false,this.showPassword = false,required this.controller,required this.hintText,this.prefixIcon,this.suffixIcon,this.width = double.infinity,required this.validator,this.textInputAction = TextInputAction.next});

  bool isPassword;
  bool showPassword;
  TextEditingController controller;
  String hintText;
  IconData? prefixIcon;
  IconButton ? suffixIcon;
  TextInputAction textInputAction;
  double width;

  FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: TextFormField(
       textInputAction: textInputAction,
        validator: validator,
        decoration: InputDecoration(
          
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: isPassword ? suffixIcon :null,
          hintText: hintText,
          prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
          
        ),
        obscureText: showPassword,
      ),
    );
  }
}