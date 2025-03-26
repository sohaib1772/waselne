// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_save_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingSaveResponseModel _$BookingSaveResponseModelFromJson(
  Map<String, dynamic> json,
) => BookingSaveResponseModel(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : BookingSaveModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookingSaveResponseModelToJson(
  BookingSaveResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

BookingSaveModel _$BookingSaveModelFromJson(Map<String, dynamic> json) =>
    BookingSaveModel(saveId: (json['saved_id'] as num?)?.toInt());

Map<String, dynamic> _$BookingSaveModelToJson(BookingSaveModel instance) =>
    <String, dynamic>{'saved_id': instance.saveId};
