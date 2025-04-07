import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/driver_profile/presentation/cubit/driver_profile_cubit.dart';
import 'package:waselne/fautures/driver_profile/presentation/cubit/driver_profile_states.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_about_me.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_confairm_email_and_phone.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_experince_and_drive_skill.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_info.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_rating_info.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_rides_and_join_date.dart';

class DriverProfileScreen extends StatelessWidget {
  DriverProfileScreen({super.key, required this.model});
  var model;
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      leading: AppButtons.iconButton(
              onPressed: () {
                AppRouter.routes.pop();
              },
              icon: Icons.arrow_back,
            ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Center(
            child: AppButtons.iconButton(
              onPressed: () {},
              icon: Icons.bookmark,
            ),
          ),
        ),
      ],
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: BlocListener<DriverProfileCubit, DriverProfileStates>(
            listener: (context, state) {
              if (state is DriverProfileError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message ?? "")));
              }
            },
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  DriverInfo(model: model),
                  AppDividers.devider(height: 30.h),
                  DriverRatingInfo(),
                  AppDividers.devider(height: 15.h),
                  DriverExperinceAndDriveSkill(),
                  DriverConfairmEmailAndPhone(),
                  AppDividers.devider(height: 15.h),
                  AppDividers.horizontalLineDivider(height: 2),
                  AppDividers.devider(height: 15.h),
                  DriverAboutMe(),
                  AppDividers.devider(height: 15.h),
                  AppDividers.horizontalLineDivider(height: 2),
                  AppDividers.devider(height: 15.h),
                  DriverRidesAndJoinDate(),
                  AppDividers.devider(height: 15.h),
                  AppDividers.horizontalLineDivider(height: 2),
                  AppDividers.devider(height: 15.h),
                  GestureDetector(
                    onTap: (){},
                    child: Text("Report this member",style: AppTextStyle.white15W500.copyWith(color: AppColors.red),),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
