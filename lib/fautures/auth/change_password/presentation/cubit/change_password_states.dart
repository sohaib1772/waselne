
abstract class ChangePasswordStates {}

class ChangePasswordInitial extends ChangePasswordStates {}

class ChangePasswordLoading extends ChangePasswordStates {}

class ChangePasswordSuccess extends ChangePasswordStates {}
class ChangePasswordCheckEmailSuccess extends ChangePasswordStates {}

class ChangePasswordError extends ChangePasswordStates {
  String message;

  ChangePasswordError({required this.message});
}