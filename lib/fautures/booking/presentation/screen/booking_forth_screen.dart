import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class BookingForthScreen extends StatelessWidget {
  const BookingForthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/booked_success.png"),
          AppDividers.devider(height: 20.h),
          Text("Your booking sent to driver to review ! ",style: AppTextStyle.whiteText20Bold,textAlign: TextAlign.center,),
          AppDividers.devider(height: 40.h),
          AppButtons.normalButton(onPressed: (){
            AppRouter.routes.pop();
          },label: LocaleKeys.main_home.tr())
        ],
      ),
    );
  }
}
