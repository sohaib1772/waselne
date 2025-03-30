
import 'package:json_annotation/json_annotation.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/personal_info_model.dart';

part 'perosnal_info_response_model.g.dart';

@JsonSerializable()
class PersonalInfoResponseModel{
  String? status;
  String ? message;
  PersonalInfoModel ? data;

  PersonalInfoResponseModel({this.status, this.message, this.data});

  factory PersonalInfoResponseModel.fromJson(Map<String, dynamic> json) => _$PersonalInfoResponseModelFromJson(json);  
}