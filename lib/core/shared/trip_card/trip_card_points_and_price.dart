import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/shared/trip_card/trip_tow_points_widget.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class TripCardPointsAndPrice extends StatelessWidget {
   TripCardPointsAndPrice({super.key,required this.model});
  var model;
  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TripTowPointsWidget(
                  pointOne: model.from[context.locale.languageCode],
                  pointTwo: model.to[context.locale.languageCode],
                  startTime: "12:00 AM",
                  endTime: "08:00 PM",
                ),

                Container(
                  padding: EdgeInsets.all(4.r),
                  decoration:  BoxDecoration(
                    color: AppColors.blueWith6Opacity,
                    borderRadius: BorderRadius.circular(9.r),
                    
                  ),
                  child: Row(children: [
                    Icon(Icons.monetization_on,color: Colors.white,size: 17.sp,),
                    Text(
                      AppFormater.moneyFormat(model.seatPrice.toString()) ?? "",
                      style: AppTextStyle.white16W900,
                    ),
                  ],),
                )
              ],  
            );
  }
}