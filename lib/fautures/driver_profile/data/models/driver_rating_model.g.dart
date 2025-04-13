// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverRatingModel _$DriverRatingModelFromJson(Map<String, dynamic> json) =>
    DriverRatingModel(
      id: (json['id'] as num?)?.toInt(),
      rate: json['rate'] as String?,
      comment: json['review'] as String?,
      createdAt: json['created_at'] as String?,
      name: json['user_name'] as String?,
    );

Map<String, dynamic> _$DriverRatingModelToJson(DriverRatingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rate': instance.rate,
      'created_at': instance.createdAt,
      'review': instance.comment,
      'user_name': instance.name,
    };
