import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class HomeFilterAvailableSeatsSlider extends StatefulWidget {
  HomeFilterAvailableSeatsSlider({super.key,required this.availableSeats});
  TextEditingController availableSeats;
  @override
  State<HomeFilterAvailableSeatsSlider> createState() => _HomeFilterAvailableSeatsSliderStates();
}

class _HomeFilterAvailableSeatsSliderStates extends State<HomeFilterAvailableSeatsSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              color: AppColors.filled,
              borderRadius: BorderRadius.circular(10.r),),
            child: Column(
              children: [
                Text(LocaleKeys.home_availableSeats.tr()),
                Text(AppFormater.moneyFormat(widget.availableSeats.text)),
                Slider(

                  divisions: 5,
                  label: AppFormater.moneyFormat(widget.availableSeats.text),
                  max: 5,
                  min: 1,
                  value: double.parse(widget.availableSeats.text), 
                  onChanged: (value) {
                  setState(() {
                    widget.availableSeats.text = value.round().toString();
                  });
                },)
              ],
            ),
          );
  }
}