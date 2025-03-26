import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_error_widget.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_cubit.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_states.dart';
import 'package:waselne/fautures/my_booking/presentation/widgets/my_bookings_card.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: BlocListener<MyBookingCubit, MyBookingStates>(
        listener: (context, state) {
          if (state is MyBookingError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message ?? LocaleKeys.dioErrors_unknownError.tr(),
                ),
              ),
            );
          }
        },
        child: BlocBuilder<MyBookingCubit, MyBookingStates>(
          builder: (context, state) {
            if (state is MyBookingLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MyBookingSuccess) {
              return RefreshIndicator(
                onRefresh: () {
                  context.read<MyBookingCubit>().getMyBooking();
                  return Future.value();
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return MyBookingsCard(model: state.data![index]);
                    },
                    separatorBuilder: (context, index) {
                      return AppDividers.devider(height: 10.h);
                    },
                    itemCount: state.data?.length ?? 0,
                  ),
                ),
              );
            } else if (state is MyBookingError) {
              return AppErrorWidget(onTap: (){
                context.read<MyBookingCubit>().getMyBooking();
              }, message: state.message ?? "");
            } else {
              return AppErrorWidget(onTap: (){
                context.read<MyBookingCubit>().getMyBooking();
              }, message: LocaleKeys.dioErrors_unknownError.tr() ?? "");
            }
          },
        ),
      ),
    );
  }
}
