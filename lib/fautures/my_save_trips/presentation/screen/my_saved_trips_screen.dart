import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/widgets/app_error_widget.dart';
import 'package:waselne/core/shared/trip_card/trip_card.dart';
import 'package:waselne/core/shared/widgets/trip_group_widget.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/fautures/my_save_trips/presentation/cubit/my_saved_trips_cubit.dart';
import 'package:waselne/fautures/my_save_trips/presentation/cubit/my_saved_trips_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class MySavedTripsScreen extends StatelessWidget {
  const MySavedTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: LocaleKeys.profileInfo_savedTrips.tr(),
      body: BlocListener<MySavedTripsCubit, MySavedTripsStates>(
        listener: (context, state) {
          if (state is MySavedTripsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message ?? LocaleKeys.dioErrors_unknownError.tr(),
                ),
              ),
            );
          }
        },
        child: BlocBuilder<MySavedTripsCubit, MySavedTripsStates>(
          buildWhen: (previous, current) => current is MySavedTripsLoading || current is MySavedTripsSuccess || current is MySavedTripsError,
          builder: (context, state) {
            if (state is MySavedTripsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MySavedTripsSuccess) {
              return Padding(
                padding: EdgeInsets.all(20.w),
                child: TripGroupWidget(tripGroup: state.data,tripCardType: TripCardType.savedTripsType,));
              
            } else if (state is MySavedTripsError) {
              return AppErrorWidget(onTap: (){
                context.read<MySavedTripsCubit>().getMySavedTrips();
              }, message: state.message ?? "");
            } else {
              return AppErrorWidget(onTap: (){
                context.read<MySavedTripsCubit>().getMySavedTrips();
              }, message: LocaleKeys.dioErrors_unknownError.tr() ?? "");
            }
          },
        ),
      ),
    );
  }
}
