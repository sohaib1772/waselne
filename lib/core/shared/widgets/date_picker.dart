import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
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

  void setBirthDate() {
    widget.dateController.text = "$selectedYear-$selectedMonth-$selectedDay";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.personal_dateOfBirth.tr(),
          style: AppTextStyle.white14W500,
        ),
        AppDividers.devider(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownMenu(
              menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.filled1Opacity),
                side: WidgetStatePropertyAll(BorderSide(color: AppColors.border)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                surfaceTintColor: WidgetStatePropertyAll(Colors.white),

              ),
              initialSelection: year.last,
              menuHeight: 200.h,
              trailingIcon: const Icon(Icons.keyboard_arrow_down_sharp),

              inputDecorationTheme: InputDecorationTheme(

                labelStyle: AppTextStyle.white14SemiBold,
                counterStyle: AppTextStyle.white14SemiBold,
                filled: true,
                fillColor: AppColors.filled,
                constraints: BoxConstraints.tight(const Size.fromHeight(40)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 1.h,
                ),
              ),
              dropdownMenuEntries:
                  year
                      .map((e) => DropdownMenuEntry(value: e, label: e,style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(AppColors.whiteText),
                        textStyle: WidgetStatePropertyAll(AppTextStyle.white14SemiBold),
                        animationDuration: Duration(milliseconds: 800),
                        alignment: Alignment.center,

                      )))
                      .toList(),
              onSelected: (value) {
                selectedYear = value.toString();
                setBirthDate();
              },
            ),
            DropdownMenu(
               menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.filled1Opacity),
                side: WidgetStatePropertyAll(BorderSide(color: AppColors.border)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                surfaceTintColor: WidgetStatePropertyAll(Colors.white),
                
              ),
              initialSelection: month[0],
              width: 90.w,
              menuHeight: 200.h,
              trailingIcon: const Icon(Icons.keyboard_arrow_down_sharp),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: AppColors.filled,
                constraints: BoxConstraints.tight(const Size.fromHeight(40)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 1.h,
                ),
              ),
              dropdownMenuEntries:
                  month
                      .map((e) => DropdownMenuEntry(value: e, label: e,style:  ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(AppColors.whiteText),
                        textStyle: WidgetStatePropertyAll(AppTextStyle.white14SemiBold),
                        animationDuration: Duration(milliseconds: 800),
                        alignment: Alignment.center,

                      )))
                      .toList(),
              onSelected: (value) {
                selectedMonth = value.toString();
                setBirthDate();
              },
            ),
            DropdownMenu(
               menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.filled1Opacity),
                side: WidgetStatePropertyAll(BorderSide(color: AppColors.border)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                surfaceTintColor: WidgetStatePropertyAll(Colors.white),
                
              ),
              initialSelection: day[0],

              width: 90.w,
              menuHeight: 200.h,
              trailingIcon: const Icon(Icons.keyboard_arrow_down_sharp),

              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: AppColors.filled,
                constraints: BoxConstraints.tight(const Size.fromHeight(40)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 1.h,
                ),
              ),
              dropdownMenuEntries:
                  day
                      .map((e) => DropdownMenuEntry(value: e, label: e,style:  ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(AppColors.whiteText),
                        textStyle: WidgetStatePropertyAll(AppTextStyle.white14SemiBold),
                        animationDuration: Duration(milliseconds: 800),
                        alignment: Alignment.center,

                      )))
                      .toList(),
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
