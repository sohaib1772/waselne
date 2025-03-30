import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/network/notifications_api.dart';
import 'package:waselne/fautures/auth/sign_up/data/sign_up_repository_impl.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.signUpRepository) : super(SignUpInitial());
  final SignUpRepositoryImpl signUpRepository;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  Future<void> signUp() async {
    emit(SignUpLoading());
    ApiResult result = await signUpRepository.signUp(
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmController.text);
    if (result.success! == true){
      emit(SignUpSuccess());
    }else{
      if(result.code == 400){
        emit(SignUpResendCode(email: emailController.text));
      }else{
      emit(SignUpError(message: result.message??"error"));
      }
    }
  }
  Future<void> loginWithGoogle(String token) async {
    emit(SignUpLoading());
    ApiResult result = await signUpRepository.loginWithGoogle(
       googleToken: token);
    if (result.success! == true){
      await uploadUserDevice(NotificationsApi.getFCMToken() ?? "", NotificationsApi.getUUID() ?? "");
      emit(LoginWithGoogleSuccess(token: result.data?.token, cities: result.data?.countries));
    }else{
      
      emit(SignUpError(message: result.message??"error"));
    }
  }

  Future<void> uploadUserDevice(String fcmToken,String uuid)async{
    emit(SignUpLoading());
    ApiResult result = await signUpRepository.uploadUserDevice(fcmToken, uuid);
    if (result.success! == true){
      emit(SignUpUploadUserDeviceSuccess());
    }else{
      emit(SignUpError(message: result.message??"error"));
    }
  }

}
