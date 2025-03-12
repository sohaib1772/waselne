import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
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
      emit(SignUpError(message: result.message??"error"));
    }
  }
}
