import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/my_booking/my_booking_helper.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class MyBookingsCard extends StatelessWidget {
  MyBookingsCard({super.key, required this.model});
  MyBookingModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(model.status == "pending"){
           AppRouter.routes.pushNamed(AppRouterNames.myBookingEditScreen,extra: model);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: MyBookingHelper.getStatusColor(model.status.toString()),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Text(MyBookingHelper.getStatus(model.status.toString()) ?? "" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Text("#${model.id.toString()}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                ),
              ],
            ),
            AppDividers.devider(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(LocaleKeys.myBookingInfo_bookingStart.tr()),
                    Text(model.startPoint?? ""),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(LocaleKeys.myBookingInfo_bookingEnd.tr()),
                    Text(model.endPoint??"",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink),),
                  ],
                ),
              ],
            ),
            AppDividers.devider(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.myBookingInfo_bookSeatNumber.tr()),
                Text(model.seatsNumber.toString()),
              ],
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.myBookingInfo_bookingDate.tr()),
                Text(AppFormater.dateFormat(model.tripStart ?? "",context.locale.languageCode)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.myBookingInfo_bookingPrice.tr()),
                Text(
                  AppFormater.moneyFormat(model.totalPrice.toString()),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.myBookingInfo_tripDriver.tr()),
                GestureDetector(
                  onTap: () {
                    AppRouter.routes.pushNamed(AppRouterNames.driverProfile,queryParameters: {"driverId": model.driverId.toString() ?? "0"});
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(model.driverName.toString() ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.myBookingInfo_bookingDetails.tr()),
                Text(model.details ?? ""),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
