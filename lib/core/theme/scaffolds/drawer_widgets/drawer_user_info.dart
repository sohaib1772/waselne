import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class DrawerUserInfo extends StatelessWidget {
  const DrawerUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(backgroundColor: AppColors.teal, radius: (30 + 2).r),
            CircleAvatar(
              backgroundColor: AppColors.filled1Opacity,
              radius: 30.r,
              child: Text("M", style: AppTextStyle.white16W900),
            ),
          ],
        ),
        AppDividers.devider(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mohammed", style: AppTextStyle.white16W900),
            AppDividers.devider(height: 5.h),
            Text("Standerd user", style: AppTextStyle.white15W500),
          ],
        ),
      ],
    );
  }
}
