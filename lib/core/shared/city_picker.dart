import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/cities_response_model.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class CityPicker extends StatefulWidget {
  CityPicker({super.key, required this.controller, required this.cities, required this.labelText});
  TextEditingController controller;
  List<CityModel>? cities;
  String? labelText;
  @override
  State<CityPicker> createState() => _CityPickerState();
}

class _CityPickerState extends State<CityPicker> {
  final dropDownKey = GlobalKey<DropdownSearchState>();
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return DropdownSearch<CityModel>(
      key: dropDownKey,
      selectedItem: widget.cities?.first,

      items: (filter, infiniteScrollProps) => widget.cities ?? [],
      itemAsString:
          (CityModel item) => item.name![context.locale.languageCode] ?? "", 
      compareFn: (item1, item2) => item1.id == item2.id, 
      onChanged: (CityModel? selectedCity) {
        if (selectedCity != null) {
          widget.controller.text =
              selectedCity.id.toString(); 
        }
      },

      decoratorProps: DropDownDecoratorProps(
        
        decoration: InputDecoration(
          labelText: widget.labelText,
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
