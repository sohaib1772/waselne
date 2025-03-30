import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ProfileButtonsCard(context: context, icon: Icons.favorite, lable: LocaleKeys.profileInfo_favoritesUsers.tr(),onTap: (){},),
          AppDividers.devider(width: 20.w),
          ProfileButtonsCard(context: context, icon: Icons.history, lable: LocaleKeys.profileInfo_savedTrips.tr(),onTap: (){
            AppRouter.routes.pushNamed(AppRouterNames.mySavedTrips);
          },),
          AppDividers.devider(width: 20.w),
          ProfileButtonsCard(context: context, icon: Icons.local_taxi, lable: LocaleKeys.profileInfo_myTrips.tr(),onTap: (){},),
          AppDividers.devider(width: 20.w),
          ProfileButtonsCard(context: context, icon: Icons.bookmark, lable: LocaleKeys.profileInfo_myBooking.tr(), onTap: (){
            AppRouter.routes.pushNamed(AppRouterNames.myBooking);
          },),

        ])]),
    );
  }
}

Widget ProfileButtonsCard({required BuildContext context,required IconData icon,required String lable,required VoidCallback onTap}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Icon(icon)
        ),
      ),
      Text(lable,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold))
    ],
  );
}
