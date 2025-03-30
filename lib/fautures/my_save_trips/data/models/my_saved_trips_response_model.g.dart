// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_saved_trips_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MySavedTripsResponseModel _$MySavedTripsResponseModelFromJson(
  Map<String, dynamic> json,
) => MySavedTripsResponseModel(
  message: json['message'] as String?,
  success: json['success'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => MySaveTripsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MySavedTripsResponseModelToJson(
  MySavedTripsResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
  'data': instance.data,
};

MySaveTripsModel _$MySaveTripsModelFromJson(Map<String, dynamic> json) =>
    MySaveTripsModel(
      id: (json['trip_id'] as num?)?.toInt(),
      from: json['from_city'] as String?,
      description: json['description'] as String?,
      to: json['to_city'] as String?,
      nameOfDriver: json['name'] as String?,
      tripStart: json['trip_start'] as String?,
      status: json['status'] as String?,
      seatPrice: (json['seat_price'] as num?)?.toDouble(),
      availableSeats: (json['available_seats'] as num?)?.toInt(),
      recordId: (json['record_id'] as num?)?.toInt(),
      isSaved: (json['is_saved'] as num?)?.toInt() ?? 1,
      driverId: (json['driver_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MySaveTripsModelToJson(MySaveTripsModel instance) =>
    <String, dynamic>{
      'trip_id': instance.id,
      'from_city': instance.from,
      'description': instance.description,
      'to_city': instance.to,
      'name': instance.nameOfDriver,
      'trip_start': instance.tripStart,
      'status': instance.status,
      'seat_price': instance.seatPrice,
      'available_seats': instance.availableSeats,
      'record_id': instance.recordId,
      'is_saved': instance.isSaved,
      'driver_id': instance.driverId,
    };
