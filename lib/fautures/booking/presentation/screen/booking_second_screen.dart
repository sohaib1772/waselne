import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/shared/trip_card/trip_tow_points_widget.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_cubit.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_states.dart';
import 'package:waselne/fautures/booking/presentation/widgets/booking_check_point.dart';
import 'package:waselne/fautures/booking/presentation/widgets/booking_select_seats.dart';
import 'package:waselne/fautures/home/data/models/home_trip_model.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class BookingSecondScreen extends StatelessWidget {
  BookingSecondScreen({
    super.key,
    required this.model,
    required this.date,
    required this.controller,
  });
  PageController controller;
  HomeTripModel model;
  String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            AppDividers.devider(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                AppFormater.dateFormat(
                      date ?? "",
                      context.locale.languageCode,
                    ) ??
                    "",
                style: AppTextStyle.white16W500,
              ),
            ),

            AppDividers.devider(height: 40),
            BookingCheckPoint(model: model),
            AppDividers.horizontalLineDivider(height: 2),
            AppDividers.devider(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppTextFormField(
                controller: context.read<BookingCubit>().detailsController,
                hintText: LocaleKeys.myBookingInfo_bookingDetails.tr(),
                validator: (value) {},
              ),
            ),
            AppDividers.devider(height: 10),
            AppDividers.horizontalLineDivider(height: 2),
            AppDividers.devider(height: 10),
            BookingSelectSeats(
              availableSeats: model.availableSeats ?? 0,
              seatPrice: model.seatPrice ?? 0,
            ),
            AppDividers.devider(height: 10),
            AppDividers.horizontalLineDivider(height: 2),
            AppDividers.devider(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppButtons.normalButton(
                onPressed: () {
                  if (!context.read<BookingCubit>().checkEndPoint &&
                      !context.read<BookingCubit>().checkStartPoint) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          LocaleKeys.inputValidation_pleaseCheckThePoints.tr(),
                        ),
                      ),
                    );
                    return;
                  }
                  controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                label: LocaleKeys.main_next.tr(),
              ),
            ),
            AppDividers.devider(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: AlignmentDirectional.center,
              child: AppButtons.iconButton(
                onPressed: () {
                  controller.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icons.arrow_back_ios_new,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
