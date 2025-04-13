// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_drivers_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteDriversResponseModel _$FavoriteDriversResponseModelFromJson(
  Map<String, dynamic> json,
) => FavoriteDriversResponseModel(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => FavoriteDriversModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$FavoriteDriversResponseModelToJson(
  FavoriteDriversResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

FavoriteDriversModel _$FavoriteDriversModelFromJson(
  Map<String, dynamic> json,
) => FavoriteDriversModel(
  id: (json['user_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$FavoriteDriversModelToJson(
  FavoriteDriversModel instance,
) => <String, dynamic>{
  'user_id': instance.id,
  'name': instance.name,
  'image': instance.image,
};
