import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class AppDividers {
  static SizedBox devider({double height = 10,double width = 0}) {
    return  SizedBox(
      height: height.h,
      width: width.w,
    );
  }
  static Widget horizontalLineDivider({double height = 1,bool setMargin = true}) {
    return Container(
      margin:setMargin ? EdgeInsets.symmetric(horizontal: 0,vertical: 10.r) : EdgeInsets.zero,
      height: height.h,
      width: double.infinity,
      color: AppColors.border,
      );
  }
  static Row textDivider({required String text}) {
    return  Row(
      children: [
        Expanded(
          child: Container(
            height: 1.h,
            color: AppColors.border,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Text(text,style: AppTextStyle.white16W500,),
        ),
        Expanded(
          child: Container(
            height: 1.h,
            color:AppColors.border,
          ),
        ),
      ],
    );
  }
}