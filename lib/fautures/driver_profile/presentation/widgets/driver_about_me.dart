import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class DriverAboutMe extends StatelessWidget {
  const DriverAboutMe({super.key});

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
                        Text("About me", style: AppTextStyle.white16W900),
                        AppDividers.devider(height: 10.h),
                        Text(
                          "This is like the description or the bio of the driver so the user can take a look on the driver",
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