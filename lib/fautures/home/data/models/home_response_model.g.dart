// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponseModel _$HomeResponseModelFromJson(Map<String, dynamic> json) =>
    HomeResponseModel(
        status: json['status'] as String?,
        message: json['message'] as String?,
        data:
            (json['data'] as List<dynamic>?)
                ?.map(
                  (e) =>
                      TripsDateGroupModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
      )
      ..pagination =
          json['pagination'] == null
              ? null
              : PaginationModel.fromJson(
                json['pagination'] as Map<String, dynamic>,
              );

Map<String, dynamic> _$HomeResponseModelToJson(HomeResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'pagination': instance.pagination,
      'data': instance.data,
    };
