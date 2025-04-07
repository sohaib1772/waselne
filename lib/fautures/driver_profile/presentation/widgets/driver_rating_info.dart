import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class DriverRatingInfo extends StatelessWidget {
  const DriverRatingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.star_rate_rounded, color: Colors.amber, size: 24.sp),
                Text("4.5", style: AppTextStyle.white15W500),
                AppDividers.devider(width: 10),
                Icon(Icons.circle, color: Colors.white, size: 5.sp),
                AppDividers.devider(width: 10),
                Text("12 Ratings", style: AppTextStyle.white15W500),
              ],
            ),
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 24.sp),
          ],
        ),
      ),
    );
  }
}
