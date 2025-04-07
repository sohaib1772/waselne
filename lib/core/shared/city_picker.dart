import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/cities_response_model.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class CityPicker extends StatefulWidget {
  CityPicker({
    super.key,
    required this.controller,
    required this.cities,
    required this.labelText,
  });
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
          widget.controller.text = selectedCity.id.toString();
        }
      },
      dropdownBuilder: (context, selectedItem) {
        return Text(
          selectedItem?.name![context.locale.languageCode] ?? '',
          style: AppTextStyle.white14SemiBold,
        );
      },
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          counterStyle: AppTextStyle.white14SemiBold,
          filled: true,
          fillColor: AppColors.filled1Opacity,
          hintStyle: AppTextStyle.white14SemiBold,

          prefixIcon: Icon(Icons.location_on),
          hintText: widget.labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          constraints: BoxConstraints.tight(const Size.fromHeight(60)),
        ),
      ),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        showSelectedItems: true,
        constraints: BoxConstraints(maxHeight: 250.h),
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            constraints: BoxConstraints(maxHeight: 48),
          ),
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          cursorHeight: 20,
        ),
        menuProps: MenuProps(
          color: AppColors.whiteText,
          backgroundColor: AppColors.filled1Opacity,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
