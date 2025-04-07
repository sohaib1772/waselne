// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeTripModel _$HomeTripModelFromJson(Map<String, dynamic> json) =>
    HomeTripModel(
      id: (json['trip_id'] as num?)?.toInt(),
      from: json['from_city'] as Map<String, dynamic>?,
      description: json['description'] as String?,
      to: json['to_city'] as Map<String, dynamic>?,
      nameOfDriver: json['name'] as String?,
      tripStart: json['trip_start'] as String?,
      status: json['status'] as String?,
      seatPrice: (json['seat_price'] as num?)?.toDouble(),
      availableSeats: (json['available_seats'] as num?)?.toInt(),
      isSaved: (json['is_saved'] as num?)?.toInt(),
      driverId: (json['driver_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HomeTripModelToJson(HomeTripModel instance) =>
    <String, dynamic>{
      'trip_id': instance.id,
      'description': instance.description,
      'status': instance.status,
      'name': instance.nameOfDriver,
      'driver_id': instance.driverId,
      'from_city': instance.from,
      'to_city': instance.to,
      'trip_start': instance.tripStart,
      'seat_price': instance.seatPrice,
      'available_seats': instance.availableSeats,
      'is_saved': instance.isSaved,
    };
