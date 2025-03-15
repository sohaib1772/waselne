import 'package:waselne/fautures/auth/personal_info/data/models/countries_response_model.dart';

sealed class CodeVerificationStates {}

class CodeVerificationInitial extends CodeVerificationStates {}

class CodeVerificationLoading extends CodeVerificationStates {}

class CodeVerificationSuccess extends CodeVerificationStates {
  String token;
  List<CountryModel> countries;
  CodeVerificationSuccess({required this.token,required this.countries});
}
class CodeVerificationCheckEmailSuccess extends CodeVerificationStates {}

class CodeVerificationResendSuccess extends CodeVerificationStates{}

class CodeVerificationError extends CodeVerificationStates {
  final String error;

  CodeVerificationError(this.error);
}
