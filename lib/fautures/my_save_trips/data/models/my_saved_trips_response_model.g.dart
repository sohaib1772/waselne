// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_saved_trips_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MySavedTripsResponseModel _$MySavedTripsResponseModelFromJson(
  Map<String, dynamic> json,
) => MySavedTripsResponseModel(
  message: json['message'] as String?,
  success: json['success'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => TripsDateGroupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MySavedTripsResponseModelToJson(
  MySavedTripsResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
  'data': instance.data,
};
