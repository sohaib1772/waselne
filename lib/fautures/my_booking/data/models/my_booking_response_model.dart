

import 'package:json_annotation/json_annotation.dart';
part 'my_booking_response_model.g.dart';
@JsonSerializable()
class MyBookingResponseModel {
  String? message;
  String? success;
  List<MyBookingModel>? data;

  MyBookingResponseModel({this.message, this.success,this.data});

  factory MyBookingResponseModel.fromJson(Map<String, dynamic> json) => _$MyBookingResponseModelFromJson(json);
  
}

@JsonSerializable()
class MyBookingModel{
  @JsonKey(name: "booking_id")
  int? id;
  @JsonKey(name: "driver_id")
  int? driverId;
  String? status;
  @JsonKey(name: "seats_number")
  int? seatsNumber;
  @JsonKey(name: "trip_start")
  String? tripStart;
  @JsonKey(name: "nots")
  String? details;
  @JsonKey(name: "from_city")
  String? startPoint;
  @JsonKey(name: "to_city")
  String? endPoint;
  @JsonKey(name: "total_price")
  int? totalPrice;
  @JsonKey(name: "trip_id")
  int? tripId;
  @JsonKey(name: "driver_name")
  String? driverName;
  

  MyBookingModel({this.id, this.driverId, this.status, this.seatsNumber, this.tripStart, this.details, this.startPoint, this.endPoint,this.totalPrice,this.driverName});

  factory MyBookingModel.fromJson(Map<String, dynamic> json) => _$MyBookingModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyBookingModelToJson(this);

}