import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/driver_profile/data/models/driver_model.dart';

class DriverRidesAndJoinDate extends StatelessWidget {
   DriverRidesAndJoinDate({super.key,required this.model});
  DriverModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${model.driverTripsCount} rides published ", style: AppTextStyle.white15W500),
            AppDividers.devider(height: 15.h),
            Text("Member since October 2022", style: AppTextStyle.white15W500),
          ],
        ),
      ),
    );
  }
}
