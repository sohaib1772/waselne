// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesResponseModel _$CountriesResponseModelFromJson(
  Map<String, dynamic> json,
) => CountriesResponseModel(
  data:
      (json['data'] as List<dynamic>)
          .map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CountriesResponseModelToJson(
  CountriesResponseModel instance,
) => <String, dynamic>{'data': instance.data};

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
  name: json['country_name'] as String?,
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{'country_name': instance.name, 'id': instance.id};
