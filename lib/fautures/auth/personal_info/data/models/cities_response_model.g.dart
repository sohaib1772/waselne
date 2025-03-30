// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesResponseModel _$CitiesResponseModelFromJson(Map<String, dynamic> json) =>
    CitiesResponseModel(
      data:
          (json['data'] as List<dynamic>)
              .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$CitiesResponseModelToJson(
  CitiesResponseModel instance,
) => <String, dynamic>{'data': instance.data};

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
  name: json['city_name'] as Map<String, dynamic>?,
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
  'city_name': instance.name,
  'id': instance.id,
};
