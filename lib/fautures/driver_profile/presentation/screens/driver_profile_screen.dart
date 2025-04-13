import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/driver_profile/data/models/driver_model.dart';
import 'package:waselne/fautures/driver_profile/presentation/cubit/driver_profile_cubit.dart';
import 'package:waselne/fautures/driver_profile/presentation/cubit/driver_profile_states.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_about_me.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_confairm_email_and_phone.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_experince_and_drive_skill.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_info.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_rating_info.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_rides_and_join_date.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class DriverProfileScreen extends StatelessWidget {
  DriverProfileScreen({super.key, required this.model});
  var model;
  DriverModel? driver;
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
            child: BlocBuilder<DriverProfileCubit, DriverProfileStates>(
              builder: (context, state) {
                if (state is DriverProfileSuccess ||
                    state is DriverProfileAddToFavorite ||
                    state is DriverProfileRemoveFromFavorite) {
                  if (state is DriverProfileAddToFavorite) {
                    driver!.isfavorite = true;
                  } else if (state is DriverProfileRemoveFromFavorite) {
                    driver!.isfavorite = false;
                  }
                  print("is Favorite ? ${driver!.isfavorite}");

                  return AppButtons.iconButton(
                    onPressed: () {
                      if (!driver!.isfavorite!) {
                        context.read<DriverProfileCubit>().addToFavorite(
                          driver!.id ?? 0,
                        );
                      } else {
                        context.read<DriverProfileCubit>().removeFromFavorite(
                          driver!.id ?? 0,
                        );
                      }
                    },
                    icon:
                        driver!.isfavorite!
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                  );
                }
                if (state is DriverProfileChangeFavoriteLoading)
                  return SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: AppColors.teal),
                  );
                return SizedBox.shrink();
              },
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
              child: BlocBuilder<DriverProfileCubit, DriverProfileStates>(
                buildWhen:
                    (previous, current) =>
                        current is DriverProfileInitial ||
                        current is DriverProfileLoading ||
                        current is DriverProfileSuccess ||
                        current is DriverProfileError,
                builder: (context, state) {
                  print("stateeeeeeeeeeeeeeeeeeee $state");
                  if (state is DriverProfileLoading) {
                    return Center(
                      child: CircularProgressIndicator(color: AppColors.teal),
                    );
                  }
                  if (state is DriverProfileSuccess) {
                    driver = state.driver!;
                    return Column(
                      children: [
                        DriverInfo(model: state.driver!),
                        AppDividers.devider(height: 30.h),
                        DriverRatingInfo(model: state.driver!),
                        AppDividers.devider(height: 15.h),
                        DriverExperinceAndDriveSkill(model: state.driver!),
                        DriverConfairmEmailAndPhone(),
                        AppDividers.devider(height: 15.h),
                        AppDividers.horizontalLineDivider(height: 2),
                        AppDividers.devider(height: 15.h),
                        DriverAboutMe(model: state.driver!),
                        AppDividers.devider(height: 15.h),
                        AppDividers.horizontalLineDivider(height: 2),
                        AppDividers.devider(height: 15.h),
                        DriverRidesAndJoinDate(model: state.driver!),
                        AppDividers.devider(height: 15.h),
                        AppDividers.horizontalLineDivider(height: 2),
                        AppDividers.devider(height: 15.h),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Report this member",
                            style: AppTextStyle.white15W500.copyWith(
                              color: AppColors.red,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: AppButtons.normalButton(
                      onPressed: () {
                        context.read<DriverProfileCubit>().getDriverInfo(
                          driverID: model.driverId,
                        );
                      },
                      label: LocaleKeys.main_tryAgain.tr(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
