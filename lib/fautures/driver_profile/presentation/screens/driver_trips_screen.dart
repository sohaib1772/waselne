import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_error_widget.dart';
import 'package:waselne/core/shared/trip_card.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/fautures/driver_profile/presentation/cubit/driver_profile_cubit.dart';
import 'package:waselne/fautures/driver_profile/presentation/cubit/driver_profile_states.dart';
import 'package:waselne/fautures/my_save_trips/presentation/cubit/my_saved_trips_cubit.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class DriverTripsScreen extends StatelessWidget {
  const DriverTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: BlocListener<DriverProfileCubit, DriverProfileStates>(
        listener: (context, state) {
          if (state is DriverProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message ?? LocaleKeys.dioErrors_unknownError.tr(),
                ),
              ),
            );
          }
        },
        child: BlocBuilder<DriverProfileCubit, DriverProfileStates>(
          builder: (context, state) {
            if (state is DriverProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DriverProfileGetCurrentTripsSuccess) {
              return RefreshIndicator(
                onRefresh: () {
                  // Todo: refresh
                  return Future.value();
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return TripCard(model: state.data[index]);
                    },
                    separatorBuilder: (context, index) {
                      return AppDividers.devider(height: 10.h);
                    },
                    itemCount: state.data.length ?? 0,
                  ),
                ),
              );
            } else if (state is DriverProfileGetAllTripsSuccess) {
              return RefreshIndicator(
                onRefresh: () {
                  // Todo: refresh
                  return Future.value();
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return TripCard(model: state.data[index]);
                    },
                    separatorBuilder: (context, index) {
                      return AppDividers.devider(height: 10.h);
                    },
                    itemCount: state.data.length ?? 0,
                  ),
                ),
              );
            } else if (state is DriverProfileError) {
              return AppErrorWidget(
                onTap: () {
                  // Todo : refresh
                },
                message: state.message ?? "",
              );
            } else {
              return AppErrorWidget(
                onTap: () {
                  // Todo : refresh
                },
                message: LocaleKeys.dioErrors_unknownError.tr() ?? "",
              );
            }
          },
        ),
      ),
    );
  }
}
