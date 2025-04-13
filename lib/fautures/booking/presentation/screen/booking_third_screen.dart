import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/core/shared/widgets/money_container.dart';
import 'package:waselne/core/shared/trip_card/trip_tow_points_widget.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_cubit.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class BookingThirdScreen extends StatelessWidget {
  BookingThirdScreen({super.key, required this.model,required this.pageController});
  TripModel model;
  PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           
          Text("Confirm booking..", style: AppTextStyle.white26Bold),
          AppDividers.devider(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              color: AppColors.darkBlue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TripTowPointsWidget(
                        pointOne: model.from?[context.locale.languageCode],
                        pointTwo: model.to?[context.locale.languageCode],
                        startTime: model.tripStart ?? "",
                        endTime: "08:00 PM",
                        height: 80,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.check_circle, color: AppColors.teal),
                          AppDividers.devider(height: 30),
                          Icon(Icons.check_circle, color: AppColors.teal),
                        ],
                      ),
                    ],
                  ),
                ),
                AppDividers.devider(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    LocaleKeys.myBookingInfo_bookingDetails.tr(),
                    style: AppTextStyle.white16W900,
                    textAlign: TextAlign.start,
                  ),
                ),
                AppDividers.devider(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    alignment: AlignmentDirectional.topStart,
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.filled,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Text(
                      context.read<BookingCubit>().detailsController.text ?? "",
                      style: AppTextStyle.white12,
                    ),
                  ),
                ),
                AppDividers.devider(height: 20),
                AppDividers.horizontalLineDivider(height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            context
                                .read<BookingCubit>()
                                .seatsCountController
                                .text,
                            style: AppTextStyle.white18W600,
                          ),
                          AppDividers.devider(width: 10),
                          Icon(Icons.event_seat, color: Colors.white, size: 20),
                        ],
                      ),
                      MoneyContainer(
                        money:
                            ((int.tryParse(
                                          context
                                              .read<BookingCubit>()
                                              .seatsCountController
                                              .text,
                                        ) ??
                                        0) *
                                    (model.seatPrice ?? 0))
                                .toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppDividers.devider(height: 20),
          BlocBuilder<BookingCubit, BookingStates>(
            builder: (context, state) {
              if (state is BookingLoadingState)
                return Center(
                  child: CircularProgressIndicator(color: AppColors.teal),
                );
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: AppButtons.normalButton(
                  onPressed: () {
                    context.read<BookingCubit>().bookTrip(
                      tripId: model.id ?? 0,
                    );
                  },
                  label: LocaleKeys.main_confirm.tr(),
                ),
              );
            },
          ),
           AppDividers.devider(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: AlignmentDirectional.center,
              child: AppButtons.iconButton(
                onPressed: () {
                  pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icons.arrow_back_ios_new,
              ),
            ),
            AppDividers.devider(height: 20),
        ],
      ),
    );
  }
}
