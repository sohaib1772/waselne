
import 'package:json_annotation/json_annotation.dart';
part 'app_seceure_refresh_token_model.g.dart';
@JsonSerializable()
class AppSeceureRefreshTokenModel {
  String? status;
  String? message;
  RefreshTokenModel? data;
  AppSeceureRefreshTokenModel(this.status, this.message, this.data);
  factory AppSeceureRefreshTokenModel.fromJson(Map<String, dynamic> json) => _$AppSeceureRefreshTokenModelFromJson(json);
}

@JsonSerializable()
class RefreshTokenModel{
  String? token;
  RefreshTokenModel(this.token);
  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) => _$RefreshTokenModelFromJson(json);

} 