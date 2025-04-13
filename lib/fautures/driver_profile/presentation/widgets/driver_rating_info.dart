import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/driver_profile/data/models/driver_model.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class DriverRatingInfo extends StatelessWidget {
  DriverRatingInfo({super.key,required this.model});
  DriverModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: AppButtons.widgetButton(
        onTap: () {
          AppRouter.routes.pushNamed(AppRouterNames.driverRating,extra: model);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.star_rate_rounded, color: Colors.amber, size: 24.sp),
                Text(AppFormater.rateingFormatter(model.driverAvgRate??""), style: AppTextStyle.white15W500),
                AppDividers.devider(width: 10),
                Icon(Icons.circle, color: Colors.white, size: 5.sp),
                AppDividers.devider(width: 10),
                Text("${model.ratings?.length} ${LocaleKeys.driverInfo_rating.tr()}", style: AppTextStyle.white15W500),
              ],
            ),
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 24.sp),
          ],
        ),
      ),
    );
  }
}
