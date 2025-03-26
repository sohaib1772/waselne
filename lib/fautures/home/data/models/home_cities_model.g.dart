// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_cities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCitiesModel _$HomeCitiesModelFromJson(Map<String, dynamic> json) =>
    HomeCitiesModel(
      name: json['city_name'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HomeCitiesModelToJson(HomeCitiesModel instance) =>
    <String, dynamic>{'city_name': instance.name, 'id': instance.id};
