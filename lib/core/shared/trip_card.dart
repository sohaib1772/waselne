import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/fautures/home/data/models/home_trip_model.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class TripCard extends StatelessWidget {
  TripCard({super.key, required this.model});
  var model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        AppRouter.routes.pushNamed(AppRouterNames.tripInfo, extra: model);
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).focusColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => AppRouter.routes.pushNamed(AppRouterNames.driverProfile,queryParameters: {"driverId": model.driverId.toString() ?? "0"}),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4.r, horizontal: 8.r),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text(
                          model.nameOfDriver ?? "",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "${LocaleKeys.tripInfo_avilableSeats.tr()} | ${model.availableSeats.toString()}" ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            AppDividers.devider(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    model.from[context.locale.languageCode] ?? "",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AppDividers.devider(width: 10),
                Icon(Icons.arrow_forward),
                AppDividers.devider(width: 10),
                Expanded(
                  child: Text(
                   model.to[context.locale.languageCode] ?? "",
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            AppDividers.devider(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                      AppFormater.dateFormat(model.tripStart ?? "") ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.grey.shade700
                      ),
                    ),
                Text(
                  AppFormater.moneyFormat(model.seatPrice.toString() ?? "") ?? "",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
