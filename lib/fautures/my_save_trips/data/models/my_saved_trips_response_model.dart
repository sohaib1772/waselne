

import 'package:json_annotation/json_annotation.dart';
import 'package:waselne/core/shared/models/trip_model.dart';

part 'my_saved_trips_response_model.g.dart';
@JsonSerializable()
class MySavedTripsResponseModel {
  String? message;
  String? success;
  List<TripsDateGroupModel>? data;

  MySavedTripsResponseModel({this.message, this.success,this.data});

  factory MySavedTripsResponseModel.fromJson(Map<String, dynamic> json) => _$MySavedTripsResponseModelFromJson(json);
  
}
