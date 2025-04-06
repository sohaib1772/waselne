import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:waselne/core/helpers/google_sign_in/google_sign_in_helper.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/generated/locale_keys.g.dart';

enum AppAuthButtonsType { google, apple, facebook }

class AppAuthButtons {
  static Widget appAuthButton(Function onPressed,
      {required AppAuthButtonsType type}) {
    return InkWell(
      radius: 8,
      borderRadius: BorderRadius.circular(8.r),

      onTap: () => onPressed(),

      child: Container(
        padding: EdgeInsets.zero,

        width: double.infinity,
        height: 44.h,

        decoration: BoxDecoration(
          color: AppColors.filled,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(getAuthLogo(type),),
            AppDividers.devider(width: 10.w),
            Text(
              LocaleKeys.auth_loginWithGoogle.tr(),
              style: AppTextStyle.white17SemiBold,
            ),
          ],
        ),
      ),
    );
  }
  static String getAuthLogo(AppAuthButtonsType type) {
    switch (type) {
      case AppAuthButtonsType.google:
        return "assets/svgs/google_logo.svg";
      case AppAuthButtonsType.apple:
        return "assets/svgs/apple_logo.svg";
      case AppAuthButtonsType.facebook:
        return "assets/svgs/facebook_logo.svg";
    }
  }
}
