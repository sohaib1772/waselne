import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_cubit.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_states.dart';
import 'package:waselne/fautures/booking/presentation/widgets/trip_info.dart';
import 'package:waselne/fautures/booking/presentation/widgets/trip_screen_driver_info.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key, required this.model});
  var model;
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
              AppRouter.routes.pop();
            }

            if(state is BookingUnSaveTripSuccessState){
              model.isSaved = 0;
             
            }
            if(state is BookingSaveTripSuccessState){
              model.isSaved = 1;
             
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TripScreenDriverInfo(
                driverName: model.nameOfDriver ?? "",
                driverId: model.driverId ?? 0,
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
