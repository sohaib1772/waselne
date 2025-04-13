import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class MoneyContainer extends StatelessWidget {
   MoneyContainer({super.key,required this.money});
  String money;
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: AppColors.blueWith6Opacity,
            borderRadius: BorderRadius.circular(9.r),
          ),
          child: Row(
            children: [
              Icon(Icons.monetization_on, color: AppColors.teal, size: 17.sp),
              Text(
                AppFormater.moneyFormat(money) ?? "",
                style: AppTextStyle.white16W900.copyWith(color: AppColors.teal),
              ),
            ],
          ),
        );
  }
}