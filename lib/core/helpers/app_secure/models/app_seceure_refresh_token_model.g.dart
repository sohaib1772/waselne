// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_seceure_refresh_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSeceureRefreshTokenModel _$AppSeceureRefreshTokenModelFromJson(
  Map<String, dynamic> json,
) => AppSeceureRefreshTokenModel(
  json['status'] as String?,
  json['message'] as String?,
  json['data'] == null
      ? null
      : RefreshTokenModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppSeceureRefreshTokenModelToJson(
  AppSeceureRefreshTokenModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

RefreshTokenModel _$RefreshTokenModelFromJson(Map<String, dynamic> json) =>
    RefreshTokenModel(json['token'] as String?);

Map<String, dynamic> _$RefreshTokenModelToJson(RefreshTokenModel instance) =>
    <String, dynamic>{'token': instance.token};
