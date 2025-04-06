import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_error_widget.dart';
import 'package:waselne/core/shared/trip_card/trip_card.dart';
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
          builder: (context, state) {
            if (state is MySavedTripsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MySavedTripsSuccess) {
              return RefreshIndicator(
                onRefresh: () {
                  context.read<MySavedTripsCubit>().getMySavedTrips();
                  return Future.value();
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return TripCard(model: state.data![index]);
                    },
                    separatorBuilder: (context, index) {
                      return AppDividers.devider(height: 10.h);
                    },
                    itemCount: state.data?.length ?? 0,
                  ),
                ),
              );
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
