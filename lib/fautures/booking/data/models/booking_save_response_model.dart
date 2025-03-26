import 'package:json_annotation/json_annotation.dart';

part 'booking_save_response_model.g.dart';

@JsonSerializable()
class BookingSaveResponseModel {
  String? status;
  String? message;
  BookingSaveModel? data;

  BookingSaveResponseModel({this.status, this.message,this.data});
  factory BookingSaveResponseModel.fromJson(Map<String, dynamic> json) => _$BookingSaveResponseModelFromJson(json);
  
}

@JsonSerializable()
class BookingSaveModel{
  @JsonKey(name: "saved_id")
  int? saveId;

  BookingSaveModel({this.saveId});
  factory BookingSaveModel.fromJson(Map<String, dynamic> json) => _$BookingSaveModelFromJson(json);
  
}

