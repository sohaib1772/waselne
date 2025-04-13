import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_states.dart';
import 'package:waselne/fautures/my_save_trips/presentation/cubit/my_saved_trips_cubit.dart';
import 'package:waselne/fautures/my_save_trips/presentation/cubit/my_saved_trips_states.dart';

class SavedTripsSaveIcon extends StatelessWidget {
  SavedTripsSaveIcon({super.key, required this.model});
  TripModel model;
  bool canPressSaveButton = true;
  @override
  Widget build(BuildContext context) {
    return AppButtons.widgetButton(
      onTap: () async {
        if (!canPressSaveButton) return;
        canPressSaveButton = false;
        
          await context.read<MySavedTripsCubit>().removeMySavedTrip(model.id);
        
        canPressSaveButton = true;
      },
      child: BlocBuilder<MySavedTripsCubit, MySavedTripsStates>(
        buildWhen:
            (previous, current) =>
                current is MySavedTripsSaveSuccessState ||
                current is MySavedTripsUnsaveSuccessState ||
                current is MySavedTripsSaveLoadingState,
        builder: (context, state) {
          if (state is MySavedTripsSaveLoadingState &&
              state.tripId == model.id) {
            return SizedBox(
              width: 24.w,
              height: 24.h,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.teal,
              ),
            );
          } else {
            return Icon(
              model?.isSaved == 0
                  ? Icons.bookmark_border_rounded
                  : Icons.bookmark,
              color: Colors.white,
              size: 24.sp,
            );
          }
        },
      ),
    );
  }
}
