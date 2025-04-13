import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable()
class PaginationModel {
  int? total;
  int? count;
  int? perPage;
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  PaginationModel({this.total, this.count, this.perPage, this.currentPage, this.totalPages});
  factory PaginationModel.fromJson(Map<String, dynamic> json) => _$PaginationModelFromJson(json);
}
