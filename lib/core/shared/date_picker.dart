import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class BirthDatePicker extends StatefulWidget {
   BirthDatePicker({super.key, required this.dateController});
  TextEditingController dateController;
  @override
  State<BirthDatePicker> createState() => _BirthDatePickerState();
}

class _BirthDatePickerState extends State<BirthDatePicker> {
  List<String> year = [];
  List<String> month = [];
  List<String> day = [];

  String? selectedYear = "1990";
  String? selectedMonth = "01";
  String? selectedDay = "01";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.dateController.text = "${DateTime.now().year - 10}-01-01";
    for (int x = 1950, y = DateTime.now().year - 10; x <= y; x++) {
      year.add(x.toString());
    }
    for (int x = 1; x <= 12; x++) {
      month.add(x.toString());
    }
    for (int x = 1; x <= 31; x++) {
      day.add(x.toString());
    }
  }
  void setBirthDate(){
    widget.dateController.text = "$selectedYear-$selectedMonth-$selectedDay";
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.personal_dateOfBirth.tr(),
        ),
        AppDividers.devider(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownMenu(
              initialSelection: year.last,
              menuHeight: 200.h,
              inputDecorationTheme: InputDecorationTheme(
                constraints: BoxConstraints.tight(const Size.fromHeight(40)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 1.h,
                ),
              ),
              dropdownMenuEntries:
                  year.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
              onSelected: (value) {
                selectedYear = value.toString();
                setBirthDate();
              },
            ),
            AppDividers.devider(width: 10.w),
            DropdownMenu(
              initialSelection: month[0],
              width: 80.w,
              menuHeight: 200.h,
              inputDecorationTheme: InputDecorationTheme(
                constraints: BoxConstraints.tight(const Size.fromHeight(40)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 1.h,
                ),
              ),
              dropdownMenuEntries:
                  month.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
              onSelected: (value) {
                selectedMonth = value.toString();
                setBirthDate();
              },
            ),
            AppDividers.devider(width: 10.w),
            DropdownMenu(
              initialSelection: day[0],
              
              width: 80.w,
              menuHeight: 200.h,
              inputDecorationTheme: InputDecorationTheme(
                constraints: BoxConstraints.tight(const Size.fromHeight(40)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 1.h,
                ),
              ),
              dropdownMenuEntries:
                  day.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
              onSelected: (value) {
                selectedDay = value.toString();
                setBirthDate();
              },
            ),
          ],
        ),
      ],
    );
  }
}
