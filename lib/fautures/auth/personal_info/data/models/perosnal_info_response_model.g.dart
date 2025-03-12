// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perosnal_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfoResponseModel _$PersonalInfoResponseModelFromJson(
  Map<String, dynamic> json,
) => PersonalInfoResponseModel(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : PersonalInfoModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PersonalInfoResponseModelToJson(
  PersonalInfoResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
