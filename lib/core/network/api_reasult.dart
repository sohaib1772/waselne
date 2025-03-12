

class ApiResult<T> {
  T? data;
  String? message;
  int? code;
  bool? success;
  ApiResult({this.data, this.message, this.code, this.success});
}