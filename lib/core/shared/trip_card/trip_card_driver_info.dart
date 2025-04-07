import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class TripCardDriverInfo extends StatelessWidget {
   TripCardDriverInfo({super.key,required this.rate,required this.name,this.imageSize = 20,required this.driverId});
  String rate;
  String name;
  double imageSize;
  int rateCount = 0;
  int driverId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.routes.pushNamed(AppRouterNames.driverProfile,queryParameters: {"driverId": driverId});
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children:[ 
              CircleAvatar(
                backgroundColor: AppColors.filled,
                radius: (imageSize + 2).r,
              ),
              CircleAvatar(
              backgroundColor: AppColors.filled,
              
              radius: imageSize.r,
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
                AppDividers.devider(width: 5.w),
                    Icon(Icons.circle,color: Colors.white,size: 5.sp,),
                    AppDividers.devider(width: 5.w),
                    Text("${rateCount.toString()}",style: AppTextStyle.white12,),
                    Text(" ${LocaleKeys.driverInfo_rating.tr()}",style: AppTextStyle.white12,),
              ])
            ])
        ],
      ),
    );
  }
}