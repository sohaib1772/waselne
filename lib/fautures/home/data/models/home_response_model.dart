
import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:waselne/fautures/home/data/models/home_trip_model.dart';
part 'home_response_model.g.dart';
@JsonSerializable()
class HomeResponseModel {
  String? status;
  String? message;
  HomePaginationModel? pagination;
  List<HomeTripModel>? data;
  
  HomeResponseModel({this.status, this.message, this.data});
  factory HomeResponseModel.fromJson(Map<String, dynamic> json) => _$HomeResponseModelFromJson(json);
}

@JsonSerializable()
class HomePaginationModel {
  int? total;
  int? count;
  int? perPage;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  HomePaginationModel({this.total, this.count, this.perPage, this.currentPage, this.totalPages});
  factory HomePaginationModel.fromJson(Map<String, dynamic> json) => _$HomePaginationModelFromJson(json);
}

