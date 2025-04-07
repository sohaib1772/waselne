import 'package:json_annotation/json_annotation.dart';
part 'home_trip_model.g.dart';
@JsonSerializable()
class HomeTripModel{
  @JsonKey(name: 'trip_id')
  int? id;
  String? description;
  String? status;
  @JsonKey(name: 'name')
  String? nameOfDriver;
  @JsonKey(name: "driver_id")
  int? driverId;
  @JsonKey(name: 'from_city')
  Map<String,dynamic>? from;
  @JsonKey(name: 'to_city')
  Map<String,dynamic>? to;
  @JsonKey(name: 'trip_start')
  String? tripStart;
  @JsonKey(name: 'seat_price')
  double? seatPrice;
  @JsonKey(name: 'available_seats')
  int? availableSeats;
  @JsonKey(name: "is_saved")
  int? isSaved;
  

  HomeTripModel({this.id, this.from, this.description, this.to, this.nameOfDriver, this.tripStart, this.status, this.seatPrice, this.availableSeats,this.isSaved,this.driverId});
  factory HomeTripModel.fromJson(Map<String, dynamic> json) => _$HomeTripModelFromJson(json);
  
}