import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/shared/trip_card/trip_tow_points_widget.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/booking/presentation/widgets/trip_screen_driver_info.dart';
import 'package:waselne/fautures/booking/presentation/widgets/trip_seats_and_price.dart';
import 'package:waselne/fautures/home/data/models/home_trip_model.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class BookingFirstScreen extends StatelessWidget {
   BookingFirstScreen({super.key,required this.date,required this.model,required this.pageController});
   PageController pageController;
  String date;
  HomeTripModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppDividers.devider(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(AppFormater.dateFormat(date ?? "",context.locale.languageCode) ?? "", style: AppTextStyle.white16W500),
                ),

                AppDividers.devider(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TripTowPointsWidget(
                    pointOne: model.from?[context.locale.languageCode],
                    pointTwo: model.to?[context.locale.languageCode],
                    startTime: model.tripStart??"",
                    endTime: "08:00 PM",
                    height: 80,
                  ),
                ),
                AppDividers.devider(height: 20),
                AppDividers.horizontalLineDivider(height: 2),
                AppDividers.devider(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TripSeatsAndPrice(model: model),
                ),
                AppDividers.devider(height: 10),
                AppDividers.horizontalLineDivider(height: 2),
                AppDividers.devider(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TripScreenDriverInfo(model: model),
                ),
                AppDividers.devider(height: 20),
                AppDividers.horizontalLineDivider(height: 2),
                AppDividers.devider(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    model.description??"",
                    style: AppTextStyle.white12,
                  ),
                ),
                AppDividers.devider(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppButtons.normalButton(
                    onPressed: () {
                      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                    },
                    label: LocaleKeys.tripInfo_bookingNow.tr(),
                  ),
                )
              ],
            ),
    );
                
  }
}