

import 'package:json_annotation/json_annotation.dart';
part 'home_cities_model.g.dart';
@JsonSerializable()
class HomeCitiesModel {
  @JsonKey(name: "city_name")
  String? name;
  int? id;
  HomeCitiesModel({this.name, this.id});

  factory HomeCitiesModel.fromJson(Map<String, dynamic> json) => _$HomeCitiesModelFromJson(json);
}