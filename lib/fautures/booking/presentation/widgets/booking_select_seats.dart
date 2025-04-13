import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/shared/widgets/money_container.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_cubit.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_states.dart';

class BookingSelectSeats extends StatelessWidget {
  BookingSelectSeats({
    super.key,
    required this.availableSeats,
    required this.seatPrice,
  });
  int availableSeats;
  double seatPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<BookingCubit, BookingStates>(
          buildWhen:
                    (previous, current) =>
                        current is BookingChagneSeatsCountState,
        builder: (context, state) {
          final cubit = context.read<BookingCubit>();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if ((int.tryParse(cubit.seatsCountController.text) ??
                                  0) >
                              1) {
                            cubit.changeSeatsCount(
                              (int.tryParse(cubit.seatsCountController.text) ??
                                      0) -
                                  1,
                            );
                          }
                        },
                        icon: Icon(Icons.remove_circle),
                        color: AppColors.whiteText,
                      ),
                      Text(
                        cubit.seatsCountController.text,
                        style: AppTextStyle.white18W600,
                      ),
                      AppDividers.devider(width: 10),
                      Icon(Icons.event_seat, color: AppColors.whiteText),
                      IconButton(
                        onPressed: () {
                          if ((int.tryParse(cubit.seatsCountController.text) ??
                                  0) <
                              availableSeats) {
                            cubit.changeSeatsCount(
                              (int.tryParse(cubit.seatsCountController.text) ??
                                      0) +
                                  1,
                            );
                          }
                        },
                        icon: Icon(Icons.add_circle),
                        color: AppColors.whiteText,
                      ),
                    ],
                  ),
              MoneyContainer(money: ((int.tryParse(cubit.seatsCountController.text)??0)*seatPrice).toString()),
            ],
          );
        },
      ),
    );
  }
}
