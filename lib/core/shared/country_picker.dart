import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/countries_response_model.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class CountryPicker extends StatefulWidget {
  CountryPicker({super.key, required this.controller, required this.countries});
  TextEditingController controller;
  List<CountryModel>? countries;
  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  final dropDownKey = GlobalKey<DropdownSearchState>();

  
  @override
  Widget build(BuildContext context) {
    // return Container(child:
    // DropdownMenu(
    //   menuHeight: 200.h,
    //   onSelected: (value) {
    //     widget.controller.text = value.toString();
    //   },
    //   inputDecorationTheme: InputDecorationTheme(
    //             constraints: BoxConstraints.tight(const Size.fromHeight(40)),
    //             contentPadding: EdgeInsets.symmetric(
    //               horizontal: 5.w,
    //               vertical: 1.h,
    //             ),
    //           ),
    //   dropdownMenuEntries: widget.countries.map((e)=> DropdownMenuEntry(value: e.id, label: e.name ?? "")).toList(),));

    return DropdownSearch<CountryModel>(
      key: dropDownKey,
      selectedItem: widget.countries?.first,
      items: (filter, infiniteScrollProps) => widget.countries ?? [],
      itemAsString:
          (CountryModel item) => item.name ?? "", 
      compareFn: (item1, item2) => item1.id == item2.id, 
      onChanged: (CountryModel? selectedCountry) {
        if (selectedCountry != null) {
          widget.controller.text =
              selectedCountry.id.toString(); 
        }
      },

      decoratorProps: DropDownDecoratorProps(
        
        decoration: InputDecoration(
          labelText: LocaleKeys.personal_country.tr(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: BoxConstraints.tight(const Size.fromHeight(60)),
        ),
      ),
      popupProps: PopupProps.menu(
        
        showSearchBox: true,
        showSelectedItems: true,
        fit: FlexFit.tight,
        constraints: BoxConstraints(
          maxHeight: 200.h,
        ),
      ),
    );
  }
}
