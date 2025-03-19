import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/fautures/home/data/models/home_trip_model.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_cubit.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_states.dart';
import 'package:waselne/fautures/booking/presentation/widgets/trip_info.dart';
import 'package:waselne/fautures/booking/presentation/widgets/trip_screen_driver_info.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key, required this.model});
  HomeTripModel model;
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Container(
        width: double.infinity,
        child: BlocListener<BookingCubit, BookingStates>(
          listener: (context, state) {
            if (state is BookingSuccessState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(LocaleKeys.tripInfo_bookingAddSuccess.tr()),
                ),
              );
            }
            if (state is BookingErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TripScreenDriverInfo(
                driverRating: "4.2",
                driverPhone: "+9937734326683",
                driverName: model.nameOfDriver ?? "",
                driverAboutMe:
                    "lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
              ),
              AppDividers.devider(height: 5),
              TripInfo(model: model),
            ],
          ),
        ),
      ),
    );
  }
}
