import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/network/notifications_api.dart';
import 'package:waselne/fautures/auth/login/data/login_repository_impl.dart';
import 'package:waselne/fautures/auth/login/presentation/cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepository) : super(LoginInitial());
  final LoginRepositoryImpl loginRepository;
  Future<void> loginWithGoogle(String token) async {
      emit(LoginLoading());
      ApiResult result = await loginRepository.loginWithGoogle(
        googleToken: token);
      if (result.success! == true){
        await loginRepository.uploadUserDevice(NotificationsApi.getFCMToken() ?? "",NotificationsApi.getUUID() ?? "");
        emit(LoginWithGoogleSuccess(token: result.data?.token, cities: result.data?.cities));
      }else{
        emit(LoginError(message: result.message??"error"));
      }
  }
}
