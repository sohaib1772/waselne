import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class ProfileContainerRow extends StatelessWidget {
   ProfileContainerRow({super.key,required  this.value, required  this.icon,required this.onTap});
  IconData icon;
  String value;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    
  return AppButtons.widgetButton(
    onTap: ()=>onTap(),
    child: Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24.sp),
          AppDividers.devider(width: 10.w),
          Text(value, style: AppTextStyle.white14SemiBold),
          Expanded(child: AppDividers.devider(width: 1.w)),
          Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 18.sp),
        ],
      ),
    ),
  );
}
}