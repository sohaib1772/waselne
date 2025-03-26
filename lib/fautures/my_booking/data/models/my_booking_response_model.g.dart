// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyBookingResponseModel _$MyBookingResponseModelFromJson(
  Map<String, dynamic> json,
) => MyBookingResponseModel(
  message: json['message'] as String?,
  success: json['success'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => MyBookingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MyBookingResponseModelToJson(
  MyBookingResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
  'data': instance.data,
};

MyBookingModel _$MyBookingModelFromJson(Map<String, dynamic> json) =>
    MyBookingModel(
      id: (json['booking_id'] as num?)?.toInt(),
      driverId: (json['driver_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      seatsNumber: (json['seats_number'] as num?)?.toInt(),
      tripStart: json['trip_start'] as String?,
      details: json['nots'] as String?,
      startPoint: json['from_city'] as String?,
      endPoint: json['to_city'] as String?,
      totalPrice: (json['total_price'] as num?)?.toInt(),
      driverName: json['driver_name'] as String?,
    )..tripId = (json['trip_id'] as num?)?.toInt();

Map<String, dynamic> _$MyBookingModelToJson(MyBookingModel instance) =>
    <String, dynamic>{
      'booking_id': instance.id,
      'driver_id': instance.driverId,
      'status': instance.status,
      'seats_number': instance.seatsNumber,
      'trip_start': instance.tripStart,
      'nots': instance.details,
      'from_city': instance.startPoint,
      'to_city': instance.endPoint,
      'total_price': instance.totalPrice,
      'trip_id': instance.tripId,
      'driver_name': instance.driverName,
    };
