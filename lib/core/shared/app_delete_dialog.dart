import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class AppDeleteDialog extends StatelessWidget {
   AppDeleteDialog({super.key,required this.onSubmit});
  Function onSubmit;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(LocaleKeys.main_areYouSure.tr(),style: TextStyle(fontSize: 28.sp,fontWeight: FontWeight.bold),),
             AppDividers.devider(height: 10.h),
            AppButtons.iconWithLabel(
              width: 150.w,
              onPressed: ()=> AppRouter.routes.pop(),label: LocaleKeys.main_cancel.tr(),icon: Icons.cancel),
               AppButtons.iconWithLabel(
              width: 150.w,
              onPressed: onSubmit,label: LocaleKeys.main_confirm.tr(),icon: Icons.check,backgroundColor: Colors.red,textColor: Colors.white),
            AppDividers.devider(height: 10.h),

          ],
        ),
      ),
    );
  }
}