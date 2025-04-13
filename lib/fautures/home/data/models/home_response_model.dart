

import 'package:json_annotation/json_annotation.dart';
import 'package:waselne/core/shared/models/pagination_model.dart';
import 'package:waselne/core/shared/models/trip_model.dart';
part 'home_response_model.g.dart';

@JsonSerializable()
class HomeResponseModel {
  String? status;
  String? message;
  PaginationModel? pagination;
  List<TripsDateGroupModel>? data;


  
  HomeResponseModel({this.status, this.message, this.data});
  factory HomeResponseModel.fromJson(Map<String, dynamic> json) => _$HomeResponseModelFromJson(json);
}


