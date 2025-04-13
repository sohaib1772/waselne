import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.veryDarkBlue,
    
    primaryColor: AppColors.teal,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBlue,

      elevation: 1,
      shadowColor: Colors.white,
      toolbarHeight: 60.h,
    ),
    
    primaryColorDark: AppColors.teal,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.whiteText),
      titleMedium: TextStyle(color: AppColors.whiteText),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.teal
    ),

    inputDecorationTheme: InputDecorationTheme(
      focusColor: AppColors.whiteText,

      fillColor: AppColors.filled,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.border, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.border, width: 1),
      ),
      hintStyle: TextStyle(
        color: AppColors.whiteText,
        fontWeight: FontWeight.w500,
        wordSpacing: 0.24,
        fontSize: 16.sp,
      ),
      labelStyle: TextStyle(
        color: AppColors.whiteText,
        fontWeight: FontWeight.w500,
        wordSpacing: 0.24,
        fontSize: 16.sp,
      ),
      prefixStyle: TextStyle(
        color: AppColors.whiteText,
        fontWeight: FontWeight.w500,
        wordSpacing: 0.24,
        fontSize: 16.sp,
      ),
      suffixStyle: TextStyle(
        color: AppColors.whiteText,
        fontWeight: FontWeight.w500,
        wordSpacing: 0.24,
        fontSize: 16.sp,
      ),
      iconColor: AppColors.whiteText,
      suffixIconColor: AppColors.whiteText,
      prefixIconColor: AppColors.whiteText,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        alignment: Alignment.bottomCenter,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
  );
}
