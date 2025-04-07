import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/shared/trip_card/trip_card_driver_info.dart';
import 'package:waselne/core/shared/trip_card/trip_card_points_and_price.dart';
import 'package:waselne/core/shared/trip_card/trip_tow_points_widget.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/home/data/models/home_trip_model.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class TripCard extends StatelessWidget {
  TripCard({super.key, required this.model,required this.date});
  var model;
  String date;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.routes.pushNamed(AppRouterNames.tripInfo, extra: model,queryParameters: {"date":date});
      },
      child: Container(
        padding: EdgeInsets.all(14.r),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.border, width: 0.2),
        ),
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
            AppDividers.horizontalLineDivider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                TripCardDriverInfo(name: model.nameOfDriver, rate: "4.2",driverId: model.driverId,),
                InkWell(
                  onTap: () async {
                    model.isSaved == 0
                        ? await context.read<HomeCubit>().saveTrip(
                          tripModel: model,
                        )
                        : await context.read<HomeCubit>().unSaveTrip(
                          tripModel: model,
                        );
                  },
                  child: BlocBuilder<HomeCubit, HomeStates>(
                    buildWhen:
                        (previous, current) =>
                            current is HomeSaveTripSuccessState ||
                            current is HomeUnSaveTripSuccessState ||
                            current is HomeSaveTripLoadingState,
                    builder: (context, state) {
                      if (state is HomeSaveTripLoadingState &&
                          state.tripId == model.id) {
                        return SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: CircularProgressIndicator(strokeWidth: 2,color: AppColors.teal,),
                        );
                      } else {
                        return Icon(
                          model.isSaved == 0
                              ? Icons.bookmark_border_rounded
                              : Icons.bookmark,
                          color: Colors.white,
                          size: 24.sp,
                        );
                      }
                    },
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
