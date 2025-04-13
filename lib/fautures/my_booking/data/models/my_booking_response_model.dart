

import 'package:json_annotation/json_annotation.dart';
import 'package:waselne/core/shared/models/trip_model.dart';
part 'my_booking_response_model.g.dart';
@JsonSerializable()
class MyBookingResponseModel {
  String? message;
  String? success;
  List<TripsDateGroupModel>? data;

  MyBookingResponseModel({this.message, this.success,this.data});

  factory MyBookingResponseModel.fromJson(Map<String, dynamic> json) => _$MyBookingResponseModelFromJson(json);
  
}

@JsonSerializable()
class MyTripBookingModel extends TripModel{
  @JsonKey(name: "booking_id")
  int? bookingId;
  String? status;
  String? nots;
  @JsonKey(name: "seats_number")
  int? myBookingSeatsCount;

  MyTripBookingModel({this.bookingId,this.nots,this.status});
  factory MyTripBookingModel.fromJson(Map<String, dynamic> json) => _$MyTripBookingModelFromJson(json);
}
