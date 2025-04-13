import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/generated/locale_keys.g.dart';

enum AppDialogType { success, error, warning }

class AppDialog extends StatelessWidget {
  AppDialog({super.key, required this.type, this.message, this.title,this.actions});
  AppDialogType type;
  String? title;
  String? message;
  List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: Center(
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: SizedBox()
             
            ),
            Animate(
              effects: [ScaleEffect(),FadeEffect()],
              child: Container(

                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.teal.withAlpha(90),
                      blurRadius: 30.0,
                      offset: const Offset(0.0, 0),
                    )
                  ],
                  color: AppColors.darkerBlue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: appSuccessDialog(
                  title: title ?? "",
                  message: message ?? "",
                  context: context,
                  type: type,
                  actions: actions
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget appSuccessDialog({
  required String title,
  required String message,
  required BuildContext context,
  List<Widget>? actions,
  required AppDialogType type
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppButtons.iconButton(
            onPressed: () => AppRouter.routes.pop(),
            icon: Icons.cancel,
          ),
        ],
      ),
      SizedBox(
        width: double.infinity / 2,
        height: 70.h,
        child: Builder(builder: (context) {
          switch(type){
            case AppDialogType.success:
              return Image.asset("assets/images/success.png",);
            case AppDialogType.error:
              return Image.asset("assets/images/error.png",);
            case AppDialogType.warning:
              return Image.asset("assets/images/warning.png");
          }
        },),
      ),
      Text(title, style: AppTextStyle.white26Bold),
      AppDividers.devider(height: 10.h),
      Text(message, style: AppTextStyle.whiteText16Bold),
      AppDividers.devider(height: 10.h),
      Padding(
        padding:EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(children: actions ?? [
          AppButtons.normalButton(onPressed: ()=>AppRouter.routes.pop(),label: LocaleKeys.main_confirm.tr())
        ]),
      ),
    ],
  );
}
