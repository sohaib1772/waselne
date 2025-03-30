import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/auth/change_password/data/change_password_repository_impl.dart';
import 'package:waselne/fautures/auth/change_password/presentation/cubit/change_password_states.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordStates> {
  ChangePasswordCubit(this.changePasswordRepository) : super(ChangePasswordInitial());
  final ChangePasswordRepositoryImpl changePasswordRepository;
  Future<void> checkEmail(String email) async {
      emit(ChangePasswordLoading());
      ApiResult result = await changePasswordRepository.checkEmail(
        email: email);
      if (result.success! == true){
        emit(ChangePasswordCheckEmailSuccess());
      }else{
        emit(ChangePasswordError(message: result.message??"error"));
      }
  }
  Future<void> changePassword(String email,String password,String confirmPassowrd,String code) async {
      emit(ChangePasswordLoading());
      ApiResult result = await changePasswordRepository.changePassword(
        email: email,
        password: password,
        confirmPassowrd: confirmPassowrd,
        code:code);
      if (result.success! == true){
        emit(ChangePasswordSuccess());
      }else{
        emit(ChangePasswordError(message: result.message??"error"));
      }
  }
}
