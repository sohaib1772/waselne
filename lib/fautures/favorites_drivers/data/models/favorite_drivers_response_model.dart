

import 'package:json_annotation/json_annotation.dart';
part 'favorite_drivers_response_model.g.dart';
@JsonSerializable()
class FavoriteDriversResponseModel {
  String? status;
  String? message;
  List<FavoriteDriversModel>? data;
  FavoriteDriversResponseModel({this.status, this.message, this.data});
  factory FavoriteDriversResponseModel.fromJson(Map<String, dynamic> json) => _$FavoriteDriversResponseModelFromJson(json);
}

@JsonSerializable()
class FavoriteDriversModel{
  @JsonKey(name: "user_id")
  int? id;
  String? name;
  String? image;
  FavoriteDriversModel({this.id, this.name, this.image});

  factory FavoriteDriversModel.fromJson(Map<String, dynamic> json) => _$FavoriteDriversModelFromJson(json);
}