import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/widgets/app_circular_image.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class ProfileNameAndAge extends StatelessWidget {
  const ProfileNameAndAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppCircularImage(driverPhoto: "", name: "X", imageSize: 35),
        AppDividers.devider(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mohammed", style: AppTextStyle.white16W900),
            AppDividers.devider(height: 5.h),
            Text("24 Age", style: AppTextStyle.white15W500),
          ],
        ),
        Expanded(child: AppDividers.devider(width: 1.w)),
        AppButtons.iconButton(onPressed: () {}, icon: Icons.edit),
      ],
    );
  }
}
