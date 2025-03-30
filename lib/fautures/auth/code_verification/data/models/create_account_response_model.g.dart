// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccountResponseModel _$CreateAccountResponseModelFromJson(
  Map<String, dynamic> json,
) => CreateAccountResponseModel(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      json['data'] == null
          ? null
          : CreateAccountSuccessResponseDataModel.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$CreateAccountResponseModelToJson(
  CreateAccountResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

CreateAccountSuccessResponseDataModel
_$CreateAccountSuccessResponseDataModelFromJson(Map<String, dynamic> json) =>
    CreateAccountSuccessResponseDataModel(
      json['token'] as String?,
      (json['cities'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateAccountSuccessResponseDataModelToJson(
  CreateAccountSuccessResponseDataModel instance,
) => <String, dynamic>{'token': instance.token, 'cities': instance.cities};
