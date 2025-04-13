import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_secure/app_secure.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/widgets/app_dialog.dart';
import 'package:waselne/core/shared/widgets/lang_picker.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/profile/presentation/widgets/profile_bottom_container.dart';
import 'package:waselne/fautures/profile/presentation/widgets/profile_container_row.dart';
import 'package:waselne/fautures/profile/presentation/widgets/profile_name_and_age.dart';
import 'package:waselne/fautures/profile/presentation/widgets/profile_top_buttons.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: LocaleKeys.main_profile.tr(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(20.w), child: ProfileNameAndAge()),
          AppDividers.devider(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ProfileTopButtons(),
          ),
          AppDividers.devider(height: 10),
          AppDividers.horizontalLineDivider(),
          AppDividers.devider(height: 10),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.personal_personalInfo.tr(),
                  style: AppTextStyle.whiteText16Bold,
                ),
                AppDividers.devider(height: 10),
                ProfileBottomContainer(
                  rows: [
                    ProfileContainerRow(
                      value: "amoke1772@gmail.com",
                      icon: Icons.email_rounded,
                      onTap: () {},
                    ),
                    ProfileContainerRow(
                      value: "07734326683",
                      icon: Icons.phone,
                      onTap: () {},
                    ),
                    ProfileContainerRow(
                      value: "Erbil,erbil shaqlawa",
                      icon: Icons.location_on,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          AppDividers.devider(height: 10),
          Center(child: LangPicker()),
          Expanded(child: AppDividers.devider(height: 1)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: AppButtons.normalButton(
              borderColor: AppColors.border,
              backgroundColor: AppColors.red.withAlpha(40),
              textColor: AppColors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AppDialog(
                        type: AppDialogType.warning,
                        title: LocaleKeys.main_warning.tr(),
                        message: LocaleKeys.main_areYouSureYouWantToLogOut.tr(),
                        actions: [
                          AppButtons.normalButton(
                            borderColor: AppColors.border,
                            backgroundColor: AppColors.red.withAlpha(40),
                            textColor: AppColors.red,
                            onPressed: () {
                              AppSecure.deleteSecuredToken();
                              AppRouter.routes.goNamed(AppRouterNames.login);
                            },
                            label: LocaleKeys.main_confirm.tr(),
                          ),
                          AppDividers.devider(height: 10),
                          AppButtons.normalButton(
                            
                            onPressed: () {
                              AppRouter.routes.pop();
                            },
                            label: LocaleKeys.main_cancel.tr(),
                          ),
                        ],
                      ),
                );
              },
              label: LocaleKeys.main_logout.tr(),
            ),
          ),
          AppDividers.devider(height: 10),
        ],
      ),
    );
  }
}
