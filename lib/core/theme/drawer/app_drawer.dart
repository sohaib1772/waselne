import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/helpers/app_secure/app_secure.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/widgets/lang_picker.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/drawer/drawer_buttons.dart';
import 'package:waselne/core/theme/drawer/drawer_close_and_notifications.dart';
import 'package:waselne/core/theme/drawer/drawer_user_info.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_cubit.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key, required this.advancedDrawerController});
  AdvancedDrawerController advancedDrawerController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          DrawerCloseAndNotifications(controller: advancedDrawerController),

          AppDividers.horizontalLineDivider(height: .5),
          AppDividers.devider(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Column(
              children: [
                AppButtons.widgetButton(
                  borderSide: context.locale.languageCode == 'ar' ? WidgetButtonBorderSide.right : WidgetButtonBorderSide.left,
                  radius: 50,
                  onTap: () {
                    context.read<MainCubit>().changeScreen(4);
                    advancedDrawerController.hideDrawer();
                  },
                  child: DrawerUserInfo(),
                ),
                AppDividers.devider(height: 15.h),
                AppDividers.horizontalLineDivider(height: .5),
                AppDividers.devider(height: 15.h),
                DrawerButtons(
                  icon: Icons.home,
                  lable: LocaleKeys.main_home.tr(),
                  onTap: () {
                    context.read<MainCubit>().changeScreen(0);
                    advancedDrawerController.hideDrawer();
                  },
                ),
                AppDividers.devider(height: 15.h),
                DrawerButtons(
                  icon: Icons.bookmark,
                  lable: LocaleKeys.profileInfo_myBooking.tr(),
                  onTap: () {
                    context.read<MainCubit>().changeScreen(1);
                    advancedDrawerController.hideDrawer();
                  },
                ),

                AppDividers.devider(height: 15.h),
                DrawerButtons(
                  icon: Icons.people,
                  lable: LocaleKeys.main_favorites.tr(),
                  onTap: () {
                    context.read<MainCubit>().changeScreen(2);
                    advancedDrawerController.hideDrawer();
                  },
                ),
                AppDividers.devider(height: 15.h),
                DrawerButtons(
                  icon: Icons.drive_eta,
                  lable: LocaleKeys.profileInfo_savedTrips.tr(),
                  onTap: () {
                    context.read<MainCubit>().changeScreen(3);
                    advancedDrawerController.hideDrawer();
                  },
                ),
               
                AppDividers.devider(height: 15.h),
                DrawerButtons(
                  icon: Icons.settings,
                  lable: LocaleKeys.main_settings.tr(),
                  onTap: () {},
                ),
                AppDividers.devider(height: 15.h),
                AppDividers.horizontalLineDivider(height: .5),
                AppDividers.devider(height: 15.h),
                DrawerButtons(
                  icon: Icons.ios_share,
                  lable: LocaleKeys.main_shareTheApp.tr(),
                  onTap: () {},
                ),
                AppDividers.devider(height: 15.h),
                DrawerButtons(
                  icon: Icons.help,
                  lable:LocaleKeys.main_helpAndFaqs.tr(),
                  onTap: () {},
                ),
                AppDividers.devider(height: 15.h),
                AppDividers.horizontalLineDivider(height: .5),
                AppDividers.devider(height: 15.h),
                DrawerButtons(
                  icon: Icons.work,
                  lable: LocaleKeys.main_beginADriver.tr(),
                  onTap: () {},
                ),
                AppDividers.devider(height: 15.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
