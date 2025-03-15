import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/auth/code_verification/data/code_verification_repo_impl.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/cubit/code_verification_states.dart';

class CodeVerificationCubit extends Cubit<CodeVerificationStates> {
  CodeVerificationCubit(this.codeVerificationRepoImpl)
    : super(CodeVerificationInitial());
  CodeVerificationRepoImpl codeVerificationRepoImpl;

  Future<void> emailVerification(String code, String email) async {
    emit(CodeVerificationLoading());
    ApiResult result = await codeVerificationRepoImpl.emailVerification(
      email,
      int.tryParse(code) ?? 0,
    );
    if (result.success! == true) {
      emit(
        CodeVerificationSuccess(token: result.data!.token, countries: result.data!.countries),
      );
    } else {
      emit(CodeVerificationError(result.message!));
    }
  }
  Future<void> resendCode(String email, bool sendCode) async {
      if (sendCode) {
        emit(CodeVerificationLoading());
        ApiResult result = await codeVerificationRepoImpl.resendCode(email);
        if (result.success! == true) {
          emit(CodeVerificationResendSuccess());
        } else {
          emit(CodeVerificationError(result.message!));
        }
      }
    }

    Future<void> resendPasswordCode(String email) async {
      emit(CodeVerificationLoading());
      ApiResult result = await codeVerificationRepoImpl.resendPasswordCode(email);
      if (result.success! == true) {
        emit(CodeVerificationResendSuccess());
      } else {
        emit(CodeVerificationError(result.message!));
      }
    }
    Future<void> passwordVerification(String code,String email) async {
      emit(CodeVerificationLoading());
       ApiResult result = await codeVerificationRepoImpl.passwordVerification(code, email);
        if (result.success! == true) {
          emit(CodeVerificationCheckEmailSuccess());
        } else {
          emit(CodeVerificationError(result.message!));
        }
     
    }
}
