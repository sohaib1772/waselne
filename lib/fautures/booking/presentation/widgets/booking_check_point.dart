import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/shared/trip_card/trip_tow_points_widget.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_cubit.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_states.dart';
import 'package:waselne/fautures/home/data/models/home_trip_model.dart';

class BookingCheckPoint extends StatelessWidget {
   BookingCheckPoint({super.key,required this.model});
  HomeTripModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                BlocBuilder<BookingCubit, BookingStates>(
                  buildWhen: (previous, current) => current is BookignChangeCheckStates,
                  builder: (context, state) {
                    bool checkStartPoint = false, checkEndPoint = false;
                    if(state is BookignChangeCheckStates) {
                      checkStartPoint = state.startPoint ?? false;
                      checkEndPoint = state.endPoint ?? false;
                    }
                    return Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<BookingCubit>().changeCheckStartPoint(!checkStartPoint);
                          },
                          icon: Icon(Icons.check_circle, color: checkStartPoint ? AppColors.teal : AppColors.filled),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<BookingCubit>().changeCheckEndPoint(!checkEndPoint);
                          },
                          icon: Icon(
                            Icons.check_circle,
                            color: checkEndPoint ? AppColors.teal : AppColors.filled,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
  }
}