import 'package:waselne/fautures/auth/personal_info/data/models/countries_response_model.dart';

abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

class SignUpSuccess extends SignUpStates {}
class LoginWithGoogleSuccess extends SignUpStates {
  String? token;
  List<CountryModel>? countries;

  LoginWithGoogleSuccess({this.token, this.countries});
}

class SignUpResendCode extends SignUpStates{
  String email;
  SignUpResendCode({required this.email});
}

class SignUpError extends SignUpStates {
  String message;

  SignUpError({required this.message});
}