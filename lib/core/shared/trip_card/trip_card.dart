import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/core/shared/trip_card/saved_trips_save_icon.dart';
import 'package:waselne/core/shared/trip_card/trip_card_driver_info.dart';
import 'package:waselne/core/shared/trip_card/trip_card_points_and_price.dart';
import 'package:waselne/core/shared/trip_card/trip_card_save_icon.dart';
import 'package:waselne/core/shared/trip_card/trip_tow_points_widget.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

enum TripCardType { homeScreenType, savedTripsType, requestedTripsType }

class TripCard extends StatelessWidget {
  TripCard({
    super.key,
    required this.model,
    required this.date,
    this.tripCardType = TripCardType.homeScreenType,
  });
  TripModel? model;
  String date;
  bool canPressSaveButton = true;

  TripCardType tripCardType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.border, width: 0.2),
      ),
      child: Column(
        children: [
          AppButtons.widgetButton(
            borderSide: WidgetButtonBorderSide.top,
            onTap: () {
              AppRouter.routes.pushNamed(
                AppRouterNames.tripInfo,
                extra: model,
                queryParameters: {"date": date},
              );
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 14.r,vertical: 14.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TripCardPointsAndPrice(model: model),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        model?.availableSeats.toString() ?? "",
                        style: AppTextStyle.white16W900,
                      ),
                      AppDividers.devider(width: 5.w),
                      Icon(
                        Icons.event_seat_rounded,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          AppDividers.horizontalLineDivider(setMargin: false),
          AppButtons.widgetButton(
            borderSide: WidgetButtonBorderSide.bottom,
            onTap: () {
              AppRouter.routes.pushNamed(
                AppRouterNames.driverProfile,
                queryParameters: {"driverId": model?.driverId.toString()},
              );
            },
            child: Padding(
              padding:  EdgeInsets.all(14.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
                children: [
                  TripCardDriverInfo(
                    name: model?.nameOfDriver ?? "",
                    rate: model?.driverRating ?? "0",
                    rateCount: model?.driverRatingCount ?? 0,
                    driverId: model?.driverId ?? 0,
                    driverPhoto: model?.driverPhoto??"",
                  ),
              
                  Builder(
                    builder: (context) {
                      switch (tripCardType) {
                        case TripCardType.homeScreenType:
                          return TripCardSaveIcon(model: model!);
                        case TripCardType.savedTripsType:
                          return SavedTripsSaveIcon(model: model!,);
                        case TripCardType.requestedTripsType:
                          return TripCardSaveIcon(model: model!);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
