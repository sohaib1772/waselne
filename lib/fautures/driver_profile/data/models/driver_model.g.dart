// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverModel _$DriverModelFromJson(Map<String, dynamic> json) => DriverModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['user_name'] as String?,
  birthDate: json['birthday'] as String?,
  ratings:
      (json['ratings'] as List<dynamic>?)
          ?.map((e) => DriverRatingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  isfavorite: json['is_favorite'] as bool?,
  driverTripsCount: (json['User_trips_count'] as num?)?.toInt(),
  driverAvgRate: json['avg_rating'] as String?,
  aboutMe: json['about_User'] as String?,
  carType: json['car_Type'] as String?,
  joinDate: json['joining_date'] as String?,
  driverPhoto: json['image'] as String?,
);

Map<String, dynamic> _$DriverModelToJson(DriverModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.name,
      'birthday': instance.birthDate,
      'ratings': instance.ratings,
      'joining_date': instance.joinDate,
      'about_User': instance.aboutMe,
      'car_Type': instance.carType,
      'is_favorite': instance.isfavorite,
      'User_trips_count': instance.driverTripsCount,
      'avg_rating': instance.driverAvgRate,
      'image': instance.driverPhoto,
    };
