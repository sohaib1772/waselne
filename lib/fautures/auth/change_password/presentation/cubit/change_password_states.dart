import 'package:waselne/fautures/auth/personal_info/data/models/countries_response_model.dart';

abstract class ChangePasswordStates {}

class ChangePasswordInitial extends ChangePasswordStates {}

class ChangePasswordLoading extends ChangePasswordStates {}

class ChangePasswordSuccess extends ChangePasswordStates {}
class ChangePasswordCheckEmailSuccess extends ChangePasswordStates {}

class ChangePasswordError extends ChangePasswordStates {
  String message;

  ChangePasswordError({required this.message});
}