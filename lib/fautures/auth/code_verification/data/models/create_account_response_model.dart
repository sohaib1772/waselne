
import 'package:json_annotation/json_annotation.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/countries_response_model.dart';

part 'create_account_response_model.g.dart';
@JsonSerializable()
class CreateAccountResponseModel {
  String? status;
  String? message;
  CreateAccountSuccessResponseDataModel? data;

  CreateAccountResponseModel({this.status, this.message, this.data});
  factory CreateAccountResponseModel.fromJson(Map<String, dynamic> json) => _$CreateAccountResponseModelFromJson(json);
}

@JsonSerializable()
class CreateAccountSuccessResponseDataModel{
  String? token;
  List<CountryModel>? countries;

  CreateAccountSuccessResponseDataModel(this.token,this.countries);

  factory CreateAccountSuccessResponseDataModel.fromJson(Map<String, dynamic> json) => _$CreateAccountSuccessResponseDataModelFromJson(json);
}