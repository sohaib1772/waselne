

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/shared/widgets/money_container.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_cubit.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_states.dart';

class MyBookingEditSelectSeats extends StatefulWidget {
  MyBookingEditSelectSeats({
    super.key,
    required this.availableSeats,
    required this.seatPrice,
    required this.seatsCountController
  });
  int availableSeats;
  double seatPrice;

  TextEditingController seatsCountController;

  @override
  State<MyBookingEditSelectSeats> createState() => _MyBookingEditSelectSeatsState();
}

class _MyBookingEditSelectSeatsState extends State<MyBookingEditSelectSeats> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if((int.tryParse(widget.seatsCountController.text)??0)>1){
                        setState(() {
                         widget.seatsCountController.text = ((int.tryParse(widget.seatsCountController.text)??0)-1).toString();
                        });
                      }
                    },
                    icon: Icon(Icons.remove_circle),
                    color: AppColors.whiteText,
                  ),
                  Text(
                    widget.seatsCountController.text,
                    style: AppTextStyle.white18W600,
                  ),
                  AppDividers.devider(width: 10),
                  Icon(Icons.event_seat, color: AppColors.whiteText),
                  IconButton(
                    onPressed: () {
                      if((int.tryParse(widget.seatsCountController.text)??0)<widget.availableSeats){
                        setState(() {
                          widget.seatsCountController.text = ((int.tryParse(widget.seatsCountController.text)??0)+1).toString();
                        });
                      }
                    },
                    icon: Icon(Icons.add_circle),
                    color: AppColors.whiteText,
                  ),
                ],
              ),
          MoneyContainer(money: ((int.tryParse(widget.seatsCountController.text)??0)*widget.seatPrice).toString()),
        ],
      ),
    );
  }
}
