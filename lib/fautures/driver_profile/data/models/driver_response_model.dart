

import 'package:json_annotation/json_annotation.dart';
import 'package:waselne/fautures/driver_profile/data/models/driver_model.dart';

part 'driver_response_model.g.dart';

@JsonSerializable()
class DriverResponseModel{
  String? status;
  String? message;
  DriverModel? data;

  DriverResponseModel({this.status,this.message,this.data});
  factory DriverResponseModel.fromJson(Map<String,dynamic> json) => _$DriverResponseModelFromJson(json);
} 