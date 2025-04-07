import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class PersonalInfoSelectGender extends StatefulWidget {
  PersonalInfoSelectGender({super.key, required this.genderController});
  TextEditingController genderController;
  @override
  State<PersonalInfoSelectGender> createState() =>
      _PersonalInfoSelectGenderState();
}

class _PersonalInfoSelectGenderState extends State<PersonalInfoSelectGender> {
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.personal_gender.tr(),
            style: AppTextStyle.white14W500),
        AppDividers.devider(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AppButtons.iconWithLabel(
                backgroundColor: AppColors.lightBlue,
                borderWidth: gender == "male" ? 2 : 1,
                textColor: Colors.white,
                width: double.infinity,
                onPressed: () {
                  setState(() {
                    gender = "male";
                    widget.genderController.text = gender!;
                  });
                },
                label: LocaleKeys.personal_Male.tr(),
                icon: Icons.person,
              ),
            ),
            AppDividers.devider(width: 10),
            Expanded(
              child: AppButtons.iconWithLabel(
                borderWidth:gender == "female" ? 2 : 1,
                textColor: Colors.white,
                backgroundColor: AppColors.teal10Opacity,
                width: double.infinity,
                onPressed: () {
                  setState(() {
                    gender = "female";
                    widget.genderController.text = gender!;
                  });
                },
                label: LocaleKeys.personal_Female.tr(),
                icon: Icons.person_2_sharp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
