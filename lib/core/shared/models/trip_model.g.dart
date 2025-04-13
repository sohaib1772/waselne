// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripsDateGroupModel _$TripsDateGroupModelFromJson(Map<String, dynamic> json) =>
    TripsDateGroupModel(
        date: json['date'] as String?,
        trips:
            (json['trips'] as List<dynamic>?)
                ?.map((e) => TripModel.fromJson(e as Map<String, dynamic>))
                .toList(),
      )
      ..mybooking =
          (json['my_booking'] as List<dynamic>?)
              ?.map(
                (e) => MyTripBookingModel.fromJson(e as Map<String, dynamic>),
              )
              .toList();

Map<String, dynamic> _$TripsDateGroupModelToJson(
  TripsDateGroupModel instance,
) => <String, dynamic>{
  'date': instance.date,
  'trips': instance.trips,
  'my_booking': instance.mybooking,
};

TripModel _$TripModelFromJson(Map<String, dynamic> json) => TripModel(
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
  driverRating: json['avg_driver_rating'] as String?,
  driverRatingCount: (json['number_of_rating'] as num?)?.toInt(),
  driverPhoto: json['image'] as String?,
);

Map<String, dynamic> _$TripModelToJson(TripModel instance) => <String, dynamic>{
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
  'avg_driver_rating': instance.driverRating,
  'number_of_rating': instance.driverRatingCount,
  'image': instance.driverPhoto,
};
