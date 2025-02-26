import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/fautures/auth/login/domain/login_repository.dart';
import 'package:waselne/fautures/auth/login/presentation/cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepository) : super(LoginInitial());
  final LoginRepository loginRepository;

}
