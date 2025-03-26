import 'package:waselne/fautures/auth/personal_info/data/models/cities_response_model.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {}

class LoginWithGoogleSuccess extends LoginStates {
  String? token;
  List<CityModel>? cities;

  LoginWithGoogleSuccess({this.token, this.cities});
}

class LoginError extends LoginStates {
  String message;

  LoginError({required this.message});
}