import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waselne/core/shared/models/cities_response_model.dart';
import 'package:waselne/core/shared/widgets/city_picker.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class HomeFilterCitiesPickers extends StatefulWidget {
  HomeFilterCitiesPickers({super.key,required this.cities,required this.cityStartController,required this.cityEndController});
  TextEditingController cityStartController ;
  TextEditingController cityEndController ;
  List<CityModel> cities;
  @override
  State<HomeFilterCitiesPickers> createState() => _HomeFilterCitiesPickersState();
}

class _HomeFilterCitiesPickersState extends State<HomeFilterCitiesPickers> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
       CityPicker(
              controller: widget.cityStartController,
              cities: widget.cities,
              labelText: LocaleKeys.home_cityStart.tr(),
            ),
            AppDividers.devider(height: 20),
            CityPicker(
              controller: widget.cityEndController,
              cities: widget.cities,
              labelText: LocaleKeys.home_cityEnd.tr(),
            ),
    ]);
  }
}