// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeTripModel _$HomeTripModelFromJson(Map<String, dynamic> json) =>
    HomeTripModel(
      id: (json['id'] as num?)?.toInt(),
      from: json['from_city'] as String?,
      description: json['description'] as String?,
      to: json['to_city'] as String?,
      nameOfDriver: json['name'] as String?,
      tripStart: json['trip_start'] as String?,
      status: json['status'] as String?,
      seatPrice: (json['seat_price'] as num?)?.toDouble(),
      availableSeats: (json['available_seats'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HomeTripModelToJson(HomeTripModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_city': instance.from,
      'description': instance.description,
      'to_city': instance.to,
      'name': instance.nameOfDriver,
      'trip_start': instance.tripStart,
      'status': instance.status,
      'seat_price': instance.seatPrice,
      'available_seats': instance.availableSeats,
    };
