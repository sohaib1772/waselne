import 'package:json_annotation/json_annotation.dart';
import 'package:waselne/fautures/driver_profile/data/models/driver_rating_model.dart';

part 'driver_model.g.dart';

@JsonSerializable()
class DriverModel {
  int? id;
  @JsonKey(name:"user_name")
  String? name;
  @JsonKey(name:"birthday")
  String? birthDate;
  List<DriverRatingModel>? ratings;
  @JsonKey(name:"joining_date")
  String? joinDate;
  @JsonKey(name:"about_User")
  String? aboutMe;
  @JsonKey(name: "car_Type")
  String?carType;
  @JsonKey(name: "is_favorite")
  bool? isfavorite;
  @JsonKey(name: "User_trips_count")
  int? driverTripsCount;
  @JsonKey(name: "avg_rating")
  String? driverAvgRate;
  @JsonKey(name: "image")
  String? driverPhoto;

  DriverModel({
    this.id,
    this.name,
    this.birthDate,
    this.ratings,
    this.isfavorite,
    this.driverTripsCount,
    this.driverAvgRate,
    this.aboutMe,
    this.carType,
    this.joinDate,
    this.driverPhoto
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) =>_$DriverModelFromJson(json);
}
