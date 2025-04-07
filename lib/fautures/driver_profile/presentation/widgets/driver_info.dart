import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/trip_card/trip_card_driver_info.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class DriverInfo extends StatelessWidget {
   DriverInfo({super.key,required this.model});
  var model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
            CircleAvatar(
              backgroundColor: AppColors.filled,
              radius: (40 + 2).r,
            ),
            CircleAvatar(
              backgroundColor: AppColors.filled,
              radius: 40.r,
              child: Text("M",style: AppTextStyle.white16W900,),
            ),
          ],),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mohammed",style: AppTextStyle.white18W600,),
              AppDividers.devider(height: 15.h),
              Text("24 years old",style: AppTextStyle.white15W500,),
            
        ]),
                AppDividers.devider(width: 25.w),
      
        Row(children: [
          Icon(Icons.star_rate_rounded,color: Colors.amber,size: 36.sp,),
          Text("4.5",style:  AppTextStyle.whiteText20Bold,),
          AppDividers.devider(width: 5.w),
        ],)
        
        ],
      
      ),
    );
  }
}