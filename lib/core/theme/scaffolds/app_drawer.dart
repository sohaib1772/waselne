import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/drawer_widgets/drawer_buttons.dart';
import 'package:waselne/core/theme/scaffolds/drawer_widgets/drawer_close_and_notifications.dart';
import 'package:waselne/core/theme/scaffolds/drawer_widgets/drawer_user_info.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key,required this.advancedDrawerController});
  AdvancedDrawerController advancedDrawerController;
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          DrawerCloseAndNotifications(controller: advancedDrawerController,),
          AppDividers.horizontalLineDivider(height: .5),
          AppDividers.devider(height: 10.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Column(
              children: [
                DrawerUserInfo(),
                AppDividers.devider(height: 15.h),
                AppDividers.horizontalLineDivider(height: .5),
                AppDividers.devider(height: 15.h),
                DrawerButtons(icon: Icons.drive_eta, lable: "Saved Trips"),
                AppDividers.devider(height: 15.h),
                DrawerButtons(icon: Icons.people, lable: "Friends"),
                AppDividers.devider(height: 15.h),
                DrawerButtons(icon: Icons.history, lable: "History"),
                AppDividers.devider(height: 15.h),
                DrawerButtons(icon: Icons.settings, lable: "Settings"),
                AppDividers.devider(height: 15.h),
                AppDividers.horizontalLineDivider(height: .5),
                AppDividers.devider(height: 15.h),
                DrawerButtons(icon: Icons.ios_share, lable: "Share The App"),
                AppDividers.devider(height: 15.h),
                DrawerButtons(icon: Icons.help, lable: "Help & FAQs"),
                AppDividers.devider(height: 15.h),
                AppDividers.horizontalLineDivider(height: .5),
                AppDividers.devider(height: 15.h),
                DrawerButtons(icon: Icons.work, lable: "Being a “Driver”"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
