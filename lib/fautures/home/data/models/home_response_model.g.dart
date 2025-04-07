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
                  (e) => HomeTripsDateGroupModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
      )
      ..pagination =
          json['pagination'] == null
              ? null
              : HomePaginationModel.fromJson(
                json['pagination'] as Map<String, dynamic>,
              );

Map<String, dynamic> _$HomeResponseModelToJson(HomeResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'pagination': instance.pagination,
      'data': instance.data,
    };

HomeTripsDateGroupModel _$HomeTripsDateGroupModelFromJson(
  Map<String, dynamic> json,
) => HomeTripsDateGroupModel(
  date: json['date'] as String?,
  trips:
      (json['trips'] as List<dynamic>?)
          ?.map((e) => HomeTripModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$HomeTripsDateGroupModelToJson(
  HomeTripsDateGroupModel instance,
) => <String, dynamic>{'date': instance.date, 'trips': instance.trips};

HomeCitiesResponseModel _$HomeCitiesResponseModelFromJson(
  Map<String, dynamic> json,
) => HomeCitiesResponseModel(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$HomeCitiesResponseModelToJson(
  HomeCitiesResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

HomePaginationModel _$HomePaginationModelFromJson(Map<String, dynamic> json) =>
    HomePaginationModel(
      total: (json['total'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      perPage: (json['perPage'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HomePaginationModelToJson(
  HomePaginationModel instance,
) => <String, dynamic>{
  'total': instance.total,
  'count': instance.count,
  'perPage': instance.perPage,
  'current_page': instance.currentPage,
  'total_pages': instance.totalPages,
};
