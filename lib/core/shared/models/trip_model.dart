import 'package:json_annotation/json_annotation.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';

part 'trip_model.g.dart';




@JsonSerializable()
class TripsDateGroupModel{
  String? date;
  List<TripModel>? trips;
  @JsonKey(name: "my_booking")
  List<MyTripBookingModel>? mybooking;
  TripsDateGroupModel({this.date, this.trips});
  factory TripsDateGroupModel.fromJson(Map<String, dynamic> json) => _$TripsDateGroupModelFromJson(json);
}

@JsonSerializable()
class TripModel {
  @JsonKey(name: 'trip_id')
  int? id;
  String? description;
  String? status;
  @JsonKey(name: 'name')
  String? nameOfDriver;
  @JsonKey(name: "driver_id")
  int? driverId;
  @JsonKey(name: 'from_city')
  Map<String, dynamic>? from;
  @JsonKey(name: 'to_city')
  Map<String, dynamic>? to;
  @JsonKey(name: 'trip_start')
  String? tripStart;
  @JsonKey(name: 'seat_price')
  double? seatPrice;
  @JsonKey(name: 'available_seats')
  int? availableSeats;
  @JsonKey(name: "is_saved")
  int? isSaved;

  @JsonKey(name: "avg_driver_rating")
  String? driverRating;
  @JsonKey(name: "number_of_rating")
  int? driverRatingCount;

  @JsonKey(name: "image")
  String? driverPhoto;

  TripModel({
    this.id,
    this.from,
    this.description,
    this.to,
    this.nameOfDriver,
    this.tripStart,
    this.status,
    this.seatPrice,
    this.availableSeats,
    this.isSaved,
    this.driverId,
    this.driverRating,
    this.driverRatingCount,
    this.driverPhoto
  });
  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);
}
