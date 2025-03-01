import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/fautures/auth/login/domain/login_repository.dart';
import 'package:waselne/fautures/auth/login/presentation/cubit/login_states.dart';
import 'package:waselne/fautures/auth/sign_up/domain/sign_up_repository.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.signUpRepository) : super(SignUpInitial());
  final SignUpRepository signUpRepository;

}
