

import 'package:json_annotation/json_annotation.dart';

part 'driver_rating_model.g.dart';

@JsonSerializable()
class DriverRatingModel{
  int? id;
  String? rate;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "review")
  String? comment;
  @JsonKey(name:"user_name")
  String? name;
  DriverRatingModel({this.id,this.rate,this.comment,this.createdAt,this.name});

  factory DriverRatingModel.fromJson(Map<String,dynamic> json) => _$DriverRatingModelFromJson(json);
}