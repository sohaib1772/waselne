import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class HomeFilterDatePickers extends StatefulWidget {
   HomeFilterDatePickers({super.key, required this.tripStartDateController, required this.tripStartTimeController});

  TextEditingController tripStartDateController;
  TextEditingController tripStartTimeController;

  @override
  State<HomeFilterDatePickers> createState() => _HomeFilterDatePickersState();
}

class _HomeFilterDatePickersState extends State<HomeFilterDatePickers> {
  DateTime? date;
  TimeOfDay? time;
  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                Column(
                  children: [
                    Text(LocaleKeys.home_date.tr()),
                    AppButtons.normalButton(
                      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
                      textColor: Colors.grey,
                      borderColor: Colors.grey,
                      onPressed: () async {
                        date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 60)),
                        );
                        setState(() {});
                      widget.tripStartDateController
                            .text = AppFormater.appDateFormat(date.toString());
                      },
                      label:
                          widget.tripStartDateController.text.isEmpty
                              ? LocaleKeys.main_any.tr()
                              : widget.tripStartDateController.text,
                    ),
                  ],
                ),
                AppDividers.devider(width: 10.w),
                Expanded(
                  child: Column(
                    children: [
                      Text(LocaleKeys.home_time.tr()),
                      AppButtons.normalButton(
                        width: 100.w,
                        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
                        textColor: Colors.grey,
                        borderColor: Colors.grey,
                        onPressed: () async {
                          time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          setState(() {});
                          widget.tripStartTimeController.text =
                              "${time?.hourOfPeriod.toString().toUpperCase()}:00 ${time?.period.name.toString().toUpperCase()}";
                        },
                        label:
                            widget.tripStartTimeController.text.isEmpty
                                ? LocaleKeys.main_any.tr()
                                : widget.tripStartTimeController.text,
                      ),
                    ],
                  ),
                ),
              ],
            );
  }
}