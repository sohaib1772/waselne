import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class ProfileTopButtons extends StatelessWidget {
  const ProfileTopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                ProfileButtonsCard(
                  icon: Icons.car_repair_rounded,
                  lable: LocaleKeys.profileInfo_myTrips.tr(),
                  onTap: () {},
                ),
                AppDividers.devider(width: 20.w),
                ProfileButtonsCard(
                  icon: Icons.reviews_rounded,
                  lable: LocaleKeys.driverInfo_rating.tr(),
                  onTap: () {},
                ),
                AppDividers.devider(width: 20.w),
                ProfileButtonsCard(
                  icon: Icons.people_rounded,
                  lable: LocaleKeys.main_favorites.tr(),
                  onTap: () {},
                ),
              ],
            );
  }
}

Widget ProfileButtonsCard({required IconData icon,required String lable,required VoidCallback onTap}) {
  return Expanded(
    child: Container(
      padding:  EdgeInsets.symmetric(vertical: 10),
       alignment: Alignment.center,
             
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.darkerBlue,
              ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon,color: Colors.white,size: 24.sp,),
          AppDividers.devider(height: 10),
          Text(lable,style: AppTextStyle.white16W500,)
        ],
      ),
    ),
  );
}