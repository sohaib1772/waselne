import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class TripCardDriverInfo extends StatelessWidget {
   TripCardDriverInfo({super.key,required this.rate,required this.name});
  String rate;
  String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children:[ 
            CircleAvatar(
              backgroundColor: AppColors.filled,
              radius: 22.r,
            ),
            CircleAvatar(
            backgroundColor: AppColors.filled,
            
            radius: 20.r,
            child: Text(name[0],style: AppTextStyle.white16W900,),),
      ]),
      
          AppDividers.devider(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(name,style: AppTextStyle.white16W900,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Icon(Icons.star_rate_rounded,color: Colors.amber,size: 22.sp,),
              Text(rate.toString(),style:  AppTextStyle.white12Bold,),
            ])
          ])
      ],
    );
  }
}