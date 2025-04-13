import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/core/shared/trip_card/trip_card_driver_info.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class TripScreenDriverInfo extends StatelessWidget {
  TripScreenDriverInfo({super.key,required this.model});
  TripModel model;
  @override
  Widget build(BuildContext context) {
    return AppButtons.widgetButton(
      onTap:
          () => AppRouter.routes.pushNamed(
            AppRouterNames.driverProfile,
            queryParameters: {"driverId": model.driverId.toString() ?? "0"},
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TripCardDriverInfo(
            rate: model.driverRating??"",
            name: model.nameOfDriver ?? "",
            imageSize: 30,
            driverId: model.driverId ?? 0,
            rateCount: model.driverRatingCount??0,
            driverPhoto: model.driverPhoto ?? "",
          ),
          Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 20),
        ],
      ),
    );
  }
}
