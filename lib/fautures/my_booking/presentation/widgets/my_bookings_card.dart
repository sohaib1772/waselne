import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/my_booking/my_booking_helper.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/shared/trip_card/trip_card_driver_info.dart';
import 'package:waselne/core/shared/trip_card/trip_tow_points_widget.dart';
import 'package:waselne/core/shared/widgets/money_container.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_info.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class MyBookingsCard extends StatelessWidget {
  MyBookingsCard({super.key, required this.model, this.date});
  MyTripBookingModel model;
  String? date;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          AppButtons.widgetButton(
            borderSide: WidgetButtonBorderSide.top,
            onTap: () {
              if (model.status == "pending") {
                AppRouter.routes.pushNamed(
                  AppRouterNames.myBookingEditScreen,
                  extra: model,
                  queryParameters: {"date": date},
                );
              }
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TripTowPointsWidget(
                        pointOne: model.from?[context.locale.languageCode],
                        pointTwo: model.to?[context.locale.languageCode],
                        startTime: model.tripStart ?? "",
                        endTime: "",
                      ),
                      MoneyContainer(
                        money:
                            (model.seatPrice ??
                                    0 * (model.myBookingSeatsCount ?? 0))
                                .toString(),
                      ),
                    ],
                  ),
                ),
                AppDividers.devider(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.event_seat, color: Colors.white, size: 24.sp),
                      AppDividers.devider(width: 10.w),
                      Text(
                        model.myBookingSeatsCount.toString(),
                        style: AppTextStyle.white16W500,
                      ),
                    ],
                  ),
                ),
                AppDividers.devider(height: 5)
              ],
            ),
          ),
          AppDividers.horizontalLineDivider(height: .5, setMargin: false),
          AppButtons.widgetButton(
            borderSide: WidgetButtonBorderSide.bottom,
            onTap: () {
              AppRouter.routes.pushNamed(
                AppRouterNames.driverProfile,
                queryParameters: {"driverId": model.driverId.toString()},
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TripCardDriverInfo(
                    rate: model.driverRating ?? "12.21",
                    rateCount: model.driverRatingCount ?? 0,
                    name: model.nameOfDriver ?? "sdW",
                    driverId: model.driverId ?? 0,
                    driverPhoto: model.driverPhoto ?? "",
                  ),

                  AppButtons.iconButton(onPressed: () {}, icon: Icons.edit),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
