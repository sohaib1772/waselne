
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/auth/code_verification/data/code_verification_repo_impl.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/cubit/code_verification_states.dart';

class CodeVerificationCubit extends Cubit<CodeVerificationStates> {
  CodeVerificationCubit(this.codeVerificationRepoImpl) : super(CodeVerificationInitial());
  CodeVerificationRepoImpl codeVerificationRepoImpl;

  Future<void> emailVerification(String code,String email) async {
    emit(CodeVerificationLoading());
    ApiResult result = await codeVerificationRepoImpl.emailVerification(email,int.tryParse(code) ?? 0);
    if (result.success! == true) {
      emit(CodeVerificationSuccess(token: result.data));
    } else {
      emit(CodeVerificationError(result.message!));
    }
  
  Future<void> passwordVerification(String code) async {
    emit(CodeVerificationLoading());
      try {
        await codeVerificationRepoImpl.passwordVerification(code);
        emit(CodeVerificationSuccess(token: ""));
      } catch (e) {
        emit(CodeVerificationError(e.toString()));
      }
    }
  }
}