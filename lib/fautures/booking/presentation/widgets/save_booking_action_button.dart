import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_cubit.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_states.dart';

class SaveBookingActionButton extends StatelessWidget {
   SaveBookingActionButton({super.key,required this.model});
    TripModel model;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingStates>(
          
          builder: (context, state) {
            if(state is BookignSaveTripLoadingState){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                    color: AppColors.teal,
                    strokeWidth: 2,
                  
                  ),
                  ),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
              child: Center(
                child: AppButtons.iconButton(
                  onPressed: () async{
                    if (model.isSaved == 1) {
                     await context.read<BookingCubit>()
                          .unSaveTrip(tripModel: model);
                    } else {
                     await  context.read<BookingCubit>()
                          .saveTrip(tripModel: model);
                    }
                  },
                  icon:
                      model.isSaved == 1
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                ),
              ),
            );
          },
        );
  }
}