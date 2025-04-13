import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/widgets/app_circular_image.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/favorites_drivers/data/models/favorite_drivers_response_model.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/cubit/favorites_drivers_cubit.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class FavoritesDriversCard extends StatelessWidget {
  FavoritesDriversCard({super.key, required this.driversModel});
  FavoriteDriversModel driversModel;
  bool canRemove = true;
  @override
  Widget build(BuildContext context) {
    return AppButtons.widgetButton(
      onTap:
          () => AppRouter.routes.pushNamed(
            AppRouterNames.driverProfile,
            queryParameters: {"driverId": driversModel.id.toString()},
          ),
      child: Container(
        padding: EdgeInsets.all(10.r),
        width: double.infinity,
        alignment: AlignmentDirectional.centerStart,
        decoration: BoxDecoration(
          color: AppColors.veryDarkBlue,
          border: Border(
            bottom: BorderSide(color: AppColors.border, width: .5.w),
          ),
        ),
        child: Row(
          children: [
            AppCircularImage(driverPhoto: driversModel.image ??"", name: driversModel.name ?? "", imageSize: 30,),
            AppDividers.devider(width: 20.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  driversModel.name ?? "",
                  style: AppTextStyle.white14SemiBold,
                ),
                AppDividers.devider(height: 5.h),
                Text(
                  LocaleKeys.driverInfo_driver.tr(),
                  style: AppTextStyle.whiteText12W400,
                ),
              ],
            ),
            Spacer(),
            AppButtons.iconButton(
              onPressed: () async {
                canRemove = false;
                await context.read<FavoritesDriversCubit>().removeFromFavorite(
                  driversModel,
                );
                canRemove = true;
              },
              icon: Icons.bookmark,
            ),
          ],
        ),
      ),
    );
  }
}
