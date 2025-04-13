import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/shared/trip_card/trip_card_driver_info.dart';
import 'package:waselne/core/shared/widgets/app_circular_image.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/driver_profile/data/models/driver_model.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class DriverInfo extends StatelessWidget {
   DriverInfo({super.key,required this.model});
  DriverModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppCircularImage(driverPhoto: model.driverPhoto ?? "", name: model.name ??"", imageSize: 45,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.name??"",style: AppTextStyle.white18W600,),
              AppDividers.devider(height: 15.h),
              Text("${AppFormater.ageFormat(model.birthDate??"")} ${LocaleKeys.personal_age.tr()}",style: AppTextStyle.white15W500,),
            
        ]),
                AppDividers.devider(width: 25.w),
      
        Row(children: [
          Icon(Icons.star_rate_rounded,color: Colors.amber,size: 36.sp,),
          Text(model.driverAvgRate?.substring(0,3) ?? "",style:  AppTextStyle.whiteText20Bold,),
          AppDividers.devider(width: 5.w),
        ],)
        
        ],
      
      ),
    );
  }
}