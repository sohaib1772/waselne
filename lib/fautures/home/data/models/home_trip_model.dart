import 'package:json_annotation/json_annotation.dart';
part 'home_trip_model.g.dart';
@JsonSerializable()
class HomeTripModel{
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

  HomeTripModel({this.id, this.from, this.description, this.to, this.nameOfDriver, this.tripStart, this.status, this.seatPrice, this.availableSeats});
  factory HomeTripModel.fromJson(Map<String, dynamic> json) => _$HomeTripModelFromJson(json);
  
}