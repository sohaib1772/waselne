import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/shared/money_container.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class TripSeatsAndPrice extends StatelessWidget {
  TripSeatsAndPrice({super.key, required this.model});
  var model;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              model.availableSeats.toString(),
              style: AppTextStyle.white16W500,
            ),
            SizedBox(width: 4),
            Icon(Icons.event_seat, color: Colors.white, size: 20),
            AppDividers.devider(width: 14.w),
            Text(
              LocaleKeys.tripInfo_tripPrice.tr(),
              style: AppTextStyle.white16W500,
            ),
          ],
        ),

        MoneyContainer(money: model.seatPrice.toString()),
      ],
    );
  }
}
