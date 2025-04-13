import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/widgets/app_error_widget.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_cubit.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_states.dart';
import 'package:waselne/fautures/my_booking/presentation/widgets/my_booking_card_groups.dart';
import 'package:waselne/fautures/my_booking/presentation/widgets/my_booking_filter_row.dart';
import 'package:waselne/fautures/my_booking/presentation/widgets/my_bookings_card.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: LocaleKeys.profileInfo_myBooking.tr(),
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
            } else if (state is MyBookingSuccess || state is MyBookingChangeStatus) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    AppDividers.devider(height: 20.h),
                    MyBookingFilterRow(),
                    AppDividers.devider(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: MyBookingCardGroups(tripGroup: context.read<MyBookingCubit>().tripsDateGroupModel ?? []),
                    ),
                  ],
                ),
              );
            }  else if (state is MyBookingError) {
              return AppErrorWidget(
                onTap: () {
                  context.read<MyBookingCubit>().getMyBooking();
                },
                message: state.message ?? "",
              );
            } else {
              return AppErrorWidget(
                onTap: () {
                  context.read<MyBookingCubit>().getMyBooking();
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
