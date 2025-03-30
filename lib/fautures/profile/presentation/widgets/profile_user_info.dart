import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              infoText(
                title: LocaleKeys.personal_firstName.tr(),
                value: "amoke amoke",
              ),
              infoText(
                title: LocaleKeys.personal_phone.tr(),
                value: "07734326683",
                crossAxisAlignment: CrossAxisAlignment.end,
              ),
            ],
          ),

          AppDividers.devider(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              infoText(title: LocaleKeys.personal_gender.tr(), value: "male"),
              infoText(
                title: LocaleKeys.personal_age.tr(),
                value: "24",
                crossAxisAlignment: CrossAxisAlignment.end,
              ),
            ],
          ),
          AppDividers.devider(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              infoText(title: LocaleKeys.personal_city.tr(), value: "erbil"),

              infoText(
                title: LocaleKeys.personal_address.tr(),
                value: "erbil shaqlawa",
                crossAxisAlignment: CrossAxisAlignment.end,
              ),
            ],
          ),
          AppDividers.devider(height: 10.h),
          infoText(
            title: LocaleKeys.auth_email.tr(),
            value: "W9NpD@example.com",
          ),
        ],
      ),
    );
  }
}

Widget infoText({
  required String title,
  required String value,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
}) {
  return Column(
    crossAxisAlignment: crossAxisAlignment,
    children: [
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
      ),
      Text(value, style: TextStyle(fontSize: 12.sp)),
    ],
  );
}
