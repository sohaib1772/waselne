sealed class CodeVerificationStates {}

class CodeVerificationInitial extends CodeVerificationStates {}

class CodeVerificationLoading extends CodeVerificationStates {}

class CodeVerificationSuccess extends CodeVerificationStates {
  String token;

  CodeVerificationSuccess({required this.token});
}

class CodeVerificationError extends CodeVerificationStates {
  final String error;

  CodeVerificationError(this.error);
}
