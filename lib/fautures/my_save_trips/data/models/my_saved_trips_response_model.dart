

import 'package:json_annotation/json_annotation.dart';

part 'my_saved_trips_response_model.g.dart';
@JsonSerializable()
class MySavedTripsResponseModel {
  String? message;
  String? success;
  List<MySaveTripsModel>? data;

  MySavedTripsResponseModel({this.message, this.success,this.data});

  factory MySavedTripsResponseModel.fromJson(Map<String, dynamic> json) => _$MySavedTripsResponseModelFromJson(json);
  
}


@JsonSerializable()
class MySaveTripsModel{
  @JsonKey(name: 'trip_id')
  int? id;
  @JsonKey(name: 'from_city')
  String? from;
  String? description;
  @JsonKey(name: 'to_city')
  String? to;
  @JsonKey(name: 'name')
  String? nameOfDriver;
  @JsonKey(name: 'trip_start')
  String? tripStart;
  String? status;
  @JsonKey(name: 'seat_price')
  double? seatPrice;
  @JsonKey(name: 'available_seats')
  int? availableSeats;
  @JsonKey(name: 'record_id')
  int? recordId;
  @JsonKey(name: "is_saved")
  int? isSaved;
  @JsonKey(name: 'driver_id')
  int? driverId;

  MySaveTripsModel({this.id, this.from, this.description, this.to, this.nameOfDriver, this.tripStart, this.status, this.seatPrice, this.availableSeats,this.recordId,this.isSaved =1,this.driverId});
  factory MySaveTripsModel.fromJson(Map<String, dynamic> json) => _$MySaveTripsModelFromJson(json);
  
}