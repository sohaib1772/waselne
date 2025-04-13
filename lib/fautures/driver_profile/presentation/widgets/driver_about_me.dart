import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/driver_profile/data/models/driver_model.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class DriverAboutMe extends StatelessWidget {
   DriverAboutMe({super.key,required this.model});
  DriverModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(LocaleKeys.driverInfo_aboutMe.tr(), style: AppTextStyle.white16W900),
                        AppDividers.devider(height: 10.h),
                        Text(
                         model.aboutMe ??"",
                          style: AppTextStyle.whiteText12W400,
                        ),
                        AppDividers.devider(height: 18.h),
                        Row(
                          children: [
                            Icon(
                              Icons.chat,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                            AppDividers.devider(width: 10.w),
                            Text(
                              "I’m chatty when I feel comfortable",
                              style: AppTextStyle.white15W500,
                            ),
                        ]),
                        AppDividers.devider(height: 18.h),
                        Row(
                          children: [
                            Icon(
                              Icons.smoke_free,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                            AppDividers.devider(width: 10.w),
                            Text(
                              "No smoking please",
                              style: AppTextStyle.white15W500,
                            ),
                        ])
                      ],
                    ),
                  );
  }
}