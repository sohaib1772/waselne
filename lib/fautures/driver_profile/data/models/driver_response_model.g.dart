// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverResponseModel _$DriverResponseModelFromJson(Map<String, dynamic> json) =>
    DriverResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data:
          json['data'] == null
              ? null
              : DriverModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DriverResponseModelToJson(
  DriverResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
