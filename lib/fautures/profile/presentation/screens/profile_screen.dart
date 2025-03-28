import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/fautures/profile/presentation/widgets/profile_buttons.dart';
import 'package:waselne/fautures/profile/presentation/widgets/profile_user_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        ProfileUserInfo(),
        Column(
          children: [
            ProfileButtons(),
            AppDividers.devider(height: 20.h),
          ],
        ),
      ],),
    );
  }
}