import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class TripTowPointsWidget extends StatelessWidget {
  TripTowPointsWidget({
    super.key,
    required this.pointOne,
    required this.pointTwo,
    required this.startTime,
    required this.endTime,
    this.height = 60,
  });
  String pointOne;
  String pointTwo;
  String startTime;
  String endTime;
  double height;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(startTime, style: AppTextStyle.white14SemiBold),
              Text(endTime, style: AppTextStyle.white14SemiBold),
            ],
          ),
        ),
        AppDividers.devider(width: 15.w),

        Container(
          height: height.h,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.circle, size: 15.sp, color: AppColors.teal),
                  Icon(
                    Icons.circle,
                    size: 10.5.sp,
                    color: AppColors.darkerBlue,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.zero,
                  width: 2,
                  height: 30,
                  color: AppColors.teal,
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.circle, size: 15.sp, color: AppColors.teal),
                  Icon(
                    Icons.circle,
                    size: 10.5.sp,
                    color: AppColors.darkerBlue,
                  ),
                ],
              ),
            ],
          ),
        ),
        AppDividers.devider(width: 5.w),
        Container(
          height: height.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(pointOne, style: AppTextStyle.white14SemiBold),

              Text(pointTwo, style: AppTextStyle.white14SemiBold),
            ],
          ),
        ),
      ],
    );
  }
}
