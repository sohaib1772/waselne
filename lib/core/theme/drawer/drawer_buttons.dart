import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class DrawerButtons extends StatelessWidget {
   DrawerButtons({super.key,required this.icon,required this.lable,required this.onTap});
  IconData icon;
  String lable;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return AppButtons.widgetButton(
      borderSide: context.locale.languageCode == 'ar' ? WidgetButtonBorderSide.right : WidgetButtonBorderSide.left,
      onTap:()=> onTap(),
      child: Row(children: [
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
      ]),
    );
  }
}