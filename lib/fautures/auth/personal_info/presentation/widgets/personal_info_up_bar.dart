import 'package:flutter/material.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class PersonalInfoUpBar extends StatelessWidget {
   PersonalInfoUpBar({super.key,required this.currentIndex});
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(children: [
          Expanded(
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.teal,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        AppDividers.devider(width: 10),
          Expanded(
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: currentIndex > 1 ? AppColors.teal : AppColors.blueGray,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],),
        AppDividers.devider(height: 5),
        Text("$currentIndex/2",style: AppTextStyle.white12Bold),
      ],
    );
  }
}