import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/profile/presentation/widgets/profile_container_row.dart';

class ProfileBottomContainer extends StatelessWidget {
  ProfileBottomContainer({super.key, required this.rows});
  List<ProfileContainerRow> rows = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 20.r),
      decoration: BoxDecoration(
        color: AppColors.darkerBlue,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          rows[0],
          AppDividers.horizontalLineDivider(height: .5),
          AppDividers.devider(height: 10.w),
          rows[1],
          AppDividers.horizontalLineDivider(height: .5),
          rows[2],
          AppDividers.devider(height: 10.w),
        ],
      ),
    );
  }
}


