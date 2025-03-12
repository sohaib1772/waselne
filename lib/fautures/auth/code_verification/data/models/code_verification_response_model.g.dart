// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_verification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeVerificationResponseModel _$CodeVerificationResponseModelFromJson(
  Map<String, dynamic> json,
) => CodeVerificationResponseModel(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : CodeVerificationResponseDataModel.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$CodeVerificationResponseModelToJson(
  CodeVerificationResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

CodeVerificationResponseDataModel _$CodeVerificationResponseDataModelFromJson(
  Map<String, dynamic> json,
) => CodeVerificationResponseDataModel(
  json['authorisation'] as Map<String, dynamic>,
);

Map<String, dynamic> _$CodeVerificationResponseDataModelToJson(
  CodeVerificationResponseDataModel instance,
) => <String, dynamic>{'authorisation': instance.authorisation};
