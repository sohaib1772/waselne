import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/driver_profile/data/models/driver_model.dart';

class DriverExperinceAndDriveSkill extends StatelessWidget {
   DriverExperinceAndDriveSkill({super.key,required this.model});
  DriverModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.explore, color: Colors.white, size: 24.sp),
              AppDividers.devider(width: 10.w),
              Text(
                "Experience level : Expecienced",
                style: AppTextStyle.white15W500,
              ),
            ],
          ),
          AppDividers.devider(height: 15.h),
          Row(
            children: [
              Icon(Icons.drive_eta_rounded, color: Colors.white, size: 24.sp),
              AppDividers.devider(width: 10.w),
              Text(model.carType??"", style: AppTextStyle.white15W500),
            ],
          ),
          AppDividers.devider(height: 10.h),
          AppDividers.horizontalLineDivider(),
        ],
      ),
    );
  }
}
