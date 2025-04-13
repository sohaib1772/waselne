import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_cubit.dart';
import 'package:waselne/fautures/my_booking/presentation/widgets/my_bookings_card.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class MyBookingCardGroups extends StatelessWidget {
  MyBookingCardGroups({super.key, required this.tripGroup});
  List<TripsDateGroupModel> tripGroup;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        List<MyTripBookingModel> mybooking = context.read<MyBookingCubit>().filterMyBooking(index);
        
        return mybooking.isNotEmpty
            ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppFormater.dateFormat(
                    tripGroup[index].date ?? "",
                    context.locale.languageCode,
                  ),
                  style: AppTextStyle.white16W900,
                ),
                AppDividers.devider(height: 10.h),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),

                  shrinkWrap: true,
                  itemBuilder: (context, ind) {
                    return MyBookingsCard(
                      model: mybooking[ind],
                      date: tripGroup[index].date ?? "",
                    );
                  },
                  separatorBuilder: (context, ind) {
                    return AppDividers.devider(height: 10.h);
                  },
                  itemCount: mybooking.length,
                ),
                AppDividers.horizontalLineDivider(),
              ],
            )
            : SizedBox.shrink();
      },
      separatorBuilder: (context, index) {
        return AppDividers.devider(height: 10.h);
      },
      itemCount: tripGroup.length,
    );
  }
}
