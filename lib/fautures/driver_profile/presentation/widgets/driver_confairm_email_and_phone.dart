import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class DriverConfairmEmailAndPhone extends StatelessWidget {
  const DriverConfairmEmailAndPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            AppDividers.devider(width: 5),
                            Icon(
                              Icons.check_circle,
                              color: AppColors.teal,
                              size: 20.sp,
                            ),
                            AppDividers.devider(width: 10.w),
                            Text("Confirme email", style: AppTextStyle.white15W500),
                          ],
                        ),
                        AppDividers.devider(height: 15.h),
                        Row(
                          children: [
                            AppDividers.devider(width: 5),
                            Icon(
                              Icons.check_circle,
                              color: AppColors.teal,
                              size: 20.sp,
                            ),
                            AppDividers.devider(width: 10.w),
                            Text("Confirme phone number", style: AppTextStyle.white15W500),
                          ],
                        ),
                      ],
                    ),
                  );
  }
}