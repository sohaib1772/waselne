import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/widgets/app_circular_image.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class TripCardDriverInfo extends StatelessWidget {
  TripCardDriverInfo({
    super.key,
    required this.rate,
    required this.rateCount,
    required this.name,
    this.imageSize = 20,
    required this.driverId,
    required this.driverPhoto,
  });
  String rate;
  String name;
  double imageSize;
  int rateCount;
  int driverId;
  String driverPhoto;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppCircularImage(driverPhoto: driverPhoto, name: name,imageSize: 25,),
        AppDividers.devider(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: AppTextStyle.white16W900),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.star_rate_rounded, color: Colors.amber, size: 22.sp),
                Text(rate.substring(0, 3), style: AppTextStyle.white12Bold),
                AppDividers.devider(width: 5.w),
                Icon(Icons.circle, color: Colors.white, size: 5.sp),
                AppDividers.devider(width: 5.w),
                Text("${rateCount.toString()}", style: AppTextStyle.white12),
                Text(
                  " ${LocaleKeys.driverInfo_rating.tr()}",
                  style: AppTextStyle.white12,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
