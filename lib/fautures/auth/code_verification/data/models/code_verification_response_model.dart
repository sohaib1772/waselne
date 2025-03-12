
import 'package:json_annotation/json_annotation.dart';

part 'code_verification_response_model.g.dart';

@JsonSerializable()
class CodeVerificationResponseModel {
  String? status;
  String? message;
  CodeVerificationResponseDataModel? data;

  CodeVerificationResponseModel({this.status, this.message, this.data});
  factory CodeVerificationResponseModel.fromJson(Map<String, dynamic> json) => _$CodeVerificationResponseModelFromJson(json);
}

@JsonSerializable()
class CodeVerificationResponseDataModel{
  Map<String, dynamic> authorisation;

  CodeVerificationResponseDataModel(this.authorisation);

  factory CodeVerificationResponseDataModel.fromJson(Map<String, dynamic> json) => _$CodeVerificationResponseDataModelFromJson(json);
}