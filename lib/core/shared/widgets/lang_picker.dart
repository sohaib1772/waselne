import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_cubit/app_cubit.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_cubit.dart';

class LangPicker extends StatelessWidget {
  const LangPicker({super.key});
  
  @override
  Widget build(BuildContext context) {
    return CustomPopup(
            showArrow: false,
            backgroundColor: AppColors.filled,
            arrowColor: AppColors.filled,
            contentDecoration: BoxDecoration(
              color: AppColors.filled,
              border: Border.all(
                color: AppColors.border,
                
                ),
                borderRadius: BorderRadius.circular(10.r),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    AppRouter.routes.pop();
                    context.read<MainCubit>().changeLanguage(context, "ar");
                  },
                  child: CountryFlag.fromCountryCode('sa',width: 40,height: 30,)),
                AppDividers.devider(height: 10),
                InkWell(
                  onTap: () {
                    AppRouter.routes.pop();
                    context.read<MainCubit>().changeLanguage(context, "en");
                  },
                  child: CountryFlag.fromCountryCode('us',width: 40,height: 30,)),
              ],
            ),
            child: Container(
              height: 28.h,
              width: 73.w,
              decoration: BoxDecoration(
                color: AppColors.filled,
                borderRadius: BorderRadius.circular(22.r),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(context.locale.languageCode.toUpperCase(),style: AppTextStyle.white12Bold,),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: AppColors.whiteText,
                )
              ]),
            ),
          );
  }
}