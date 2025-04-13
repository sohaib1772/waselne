import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waselne/core/shared/widgets/lang_picker.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

Widget entryScreensHeader(String headerText,String secondryText,{double dividerHeight = 80}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      AppDividers.devider(height: 40.h),
      AppDividers.devider(height: dividerHeight.h),
      SvgPicture.asset("assets/svgs/logo.svg", height: 100.h),
      AppDividers.devider(height: 14.h),
      Text(headerText, style: AppTextStyle.white26Bold),
      AppDividers.devider(height: 4.h),
      Text(secondryText, style: AppTextStyle.white15W500, textAlign: TextAlign.center,),
      AppDividers.devider(height: 40.h),
    ],
  );
}
