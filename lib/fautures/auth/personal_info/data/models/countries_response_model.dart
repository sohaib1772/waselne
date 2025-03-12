

import 'package:json_annotation/json_annotation.dart';

part 'countries_response_model.g.dart';

@JsonSerializable()
class CountriesResponseModel {
  final List<CountryModel> data;

  CountriesResponseModel({required this.data});

  factory CountriesResponseModel.fromJson(Map<String, dynamic> json) => _$CountriesResponseModelFromJson(json);
}

@JsonSerializable()
class CountryModel {
  @JsonKey(name:"country_name")
  final String? name;
  final int? id;

  CountryModel({required this.name, required this.id});

  factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);
}

  
