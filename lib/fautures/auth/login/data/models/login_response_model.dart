
import 'package:json_annotation/json_annotation.dart';
import 'package:waselne/fautures/auth/login/data/models/login_model.dart';
part 'login_response_model.g.dart';
@JsonSerializable()
class LoginResponseModel {
  String? status;
  String? message;
  LoginModel? data;

  LoginResponseModel({this.status, this.message, this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}