import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryPicker extends StatefulWidget {
   CountryPicker({super.key,required this.controller});
  TextEditingController controller;
  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {

  List<String> countries = ["Egypt", "Saudi Arabia", "Kuwait", "Syria", "Iraq"];
  List<String> values = ["909", "910", "911", "912", "913"];
  @override
  Widget build(BuildContext context) {
    return Container(child: 
    DropdownMenu(
      onSelected: (value) {
        widget.controller.text = value ?? "";
      },
      initialSelection: countries[0],
      inputDecorationTheme: InputDecorationTheme(
                constraints: BoxConstraints.tight(const Size.fromHeight(40)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 1.h,
                ),
              ),
      dropdownMenuEntries: countries.map((e)=> DropdownMenuEntry(value: values[countries.indexOf(e)], label: e)).toList(),));
  }
}