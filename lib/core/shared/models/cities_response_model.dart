import 'package:json_annotation/json_annotation.dart';
part 'cities_response_model.g.dart';
@JsonSerializable()
class CitiesResponseModel {
  final List<CityModel> data;

  CitiesResponseModel({required this.data});

  factory CitiesResponseModel.fromJson(Map<String, dynamic> json) => _$CitiesResponseModelFromJson(json);
}

@JsonSerializable()
class CityModel {
  @JsonKey(name:"city_name")
  final Map<String,dynamic>? name;
  final int? id;

  CityModel({required this.name, required this.id});

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);
}
