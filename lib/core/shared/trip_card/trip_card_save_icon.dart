import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_states.dart';

class TripCardSaveIcon extends StatelessWidget {
   TripCardSaveIcon({super.key,required this.model});
  TripModel model;
  bool canPressSaveButton = true;
  @override
  Widget build(BuildContext context) {
    return AppButtons.widgetButton(
                      
                      onTap: () async {
                        if (!canPressSaveButton) return;
                        canPressSaveButton = false;
                        if (model?.isSaved == 0) {
                          await context.read<HomeCubit>().saveTrip(
                            tripModel: model,
                          );
                        } else {
                          await context.read<HomeCubit>().unSaveTrip(
                            tripModel: model,
                          );
                        }
                        canPressSaveButton = true;
                      },
                      child: BlocBuilder<HomeCubit, HomeStates>(
                        buildWhen:
                            (previous, current) =>
                                current is HomeSaveTripSuccessState ||
                                current is HomeUnSaveTripSuccessState ||
                                current is HomeSaveTripLoadingState,
                        builder: (context, state) {
                          if (state is HomeSaveTripLoadingState &&
                              state.tripId == model?.id) {
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