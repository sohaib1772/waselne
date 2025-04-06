import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_states.dart';
import 'package:waselne/fautures/home/data/models/home_trip_model.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_cubit.dart';
import 'package:waselne/fautures/booking/presentation/widgets/trip_booking_bottom_sheet.dart';
import 'package:waselne/generated/locale_keys.g.dart';
import 'dart:ui' as ui;

class TripInfo extends StatelessWidget {
  TripInfo({super.key, required this.model});
  var model;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.tripInfo_tripDetails.tr() ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(model.description ?? ""),
                  ],
                ),
              ),
              AppDividers.devider(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.tripInfo_tripStart.tr() ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                    Text(model.from[context.locale.languageCode] ?? ""),
                    AppDividers.devider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.tripInfo_tripEnd.tr() ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(Icons.arrow_back),
                      ],
                    ),
                    Text(model.to[context.locale.languageCode] ?? ""),
                  ],
                ),
              ),
              AppDividers.devider(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.tripInfo_tripPrice.tr() ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      AppFormater.moneyFormat(model.seatPrice.toString()) ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
              AppDividers.devider(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.blue.shade400,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.tripInfo_tripDate.tr() ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      model.tripStart?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                      textDirection: ui.TextDirection.ltr,
                    ),
                  ],
                ),
              ),
              AppDividers.devider(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButtons.iconWithLabel(
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder:
                            (context) => TripBookingBottomSheet(
                              maxSeats: model.availableSeats ?? 0,
                              seatPrice: model.seatPrice ?? 0,
                              tripId: model.id ?? 0,
                              cubit: context.read<BookingCubit>(),
                            ),
                        enableDrag: true,
                        backgroundColor: Colors.transparent,                        
                        
                      );
                    },
                    label: LocaleKeys.tripInfo_bookingNow.tr(),
                    icon: Icons.check_box_rounded,
                    width: MediaQuery.of(context).size.width / 2,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                  ),
                  IconButton(
                    color: Colors.red,
                    onPressed: () {
                      print(model.isSaved);
                      if (model.isSaved == 0) {
                        context.read<BookingCubit>().saveTrip(tripId: model.id ?? 0);
                      }else if(model.isSaved == 1){ 
                        context.read<BookingCubit>().unSaveTrip(tripId: model.id ?? 0);
                      }
                    },
                    icon: BlocBuilder<BookingCubit, BookingStates>(
                      builder: (context, state) {
                        return Icon(
                          model.isSaved == 0
                              ? Icons.bookmark_added_outlined
                              : Icons.bookmark,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
