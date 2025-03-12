


import 'package:json_annotation/json_annotation.dart';

part 'personal_info_model.g.dart';
@JsonSerializable()
class PersonalInfoModel{
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;

  String? email;
  String? phone;
  String? address;
  String? city;

  String? gender;
  String? birthday;

  @JsonKey(name: "country_id")
  String? country;


  PersonalInfoModel({this.firstName, this.lastName, this.email, this.phone, this.address, this.city, this.gender, this.birthday, this.country});

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) => _$PersonalInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoModelToJson(this);
}