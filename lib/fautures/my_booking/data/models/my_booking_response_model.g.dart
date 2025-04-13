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
          ?.map((e) => TripsDateGroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MyBookingResponseModelToJson(
  MyBookingResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
  'data': instance.data,
};

MyTripBookingModel _$MyTripBookingModelFromJson(Map<String, dynamic> json) =>
    MyTripBookingModel(
        bookingId: (json['booking_id'] as num?)?.toInt(),
        nots: json['nots'] as String?,
        status: json['status'] as String?,
      )
      ..id = (json['trip_id'] as num?)?.toInt()
      ..description = json['description'] as String?
      ..nameOfDriver = json['name'] as String?
      ..driverId = (json['driver_id'] as num?)?.toInt()
      ..from = json['from_city'] as Map<String, dynamic>?
      ..to = json['to_city'] as Map<String, dynamic>?
      ..tripStart = json['trip_start'] as String?
      ..seatPrice = (json['seat_price'] as num?)?.toDouble()
      ..availableSeats = (json['available_seats'] as num?)?.toInt()
      ..isSaved = (json['is_saved'] as num?)?.toInt()
      ..driverRating = json['avg_driver_rating'] as String?
      ..driverRatingCount = (json['number_of_rating'] as num?)?.toInt()
      ..driverPhoto = json['image'] as String?
      ..myBookingSeatsCount = (json['seats_number'] as num?)?.toInt();

Map<String, dynamic> _$MyTripBookingModelToJson(MyTripBookingModel instance) =>
    <String, dynamic>{
      'trip_id': instance.id,
      'description': instance.description,
      'name': instance.nameOfDriver,
      'driver_id': instance.driverId,
      'from_city': instance.from,
      'to_city': instance.to,
      'trip_start': instance.tripStart,
      'seat_price': instance.seatPrice,
      'available_seats': instance.availableSeats,
      'is_saved': instance.isSaved,
      'avg_driver_rating': instance.driverRating,
      'number_of_rating': instance.driverRatingCount,
      'image': instance.driverPhoto,
      'booking_id': instance.bookingId,
      'status': instance.status,
      'nots': instance.nots,
      'seats_number': instance.myBookingSeatsCount,
    };
