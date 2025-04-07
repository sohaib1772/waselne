import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class DrawerButtons extends StatelessWidget {
   DrawerButtons({super.key,required this.icon,required this.lable});
  IconData icon;
  String lable;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.darkerBlue,
          borderRadius: BorderRadius.circular(9.r),
        ),
        child: 
          Icon(icon,color: Colors.white,size: 24.sp,),
        
      ),
      AppDividers.devider(width: 15.w),
      Text(lable,style:AppTextStyle.white16W500)
    ]);
  }
}