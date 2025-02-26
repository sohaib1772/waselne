import 'package:waselne/fautures/auth/login/data/api/login_api.dart';
import 'package:waselne/fautures/auth/login/domain/login_repository.dart';

class LoginRepositoryImpl  implements LoginRepository{

  LoginRepositoryImpl({required this.loginApi});
  final LoginApi loginApi;
  @override
  Future<void> login(String email, String password) { // here it's should be return Future<LoginModel>
    return loginApi.login({"email":email,"password":password});
  }

  @override
  Future<void> loginViaGoogle(String email, String password) { // here it's should be return Future<LoginModel>
    return loginApi.loginViaGoogle({"email":email,"password":password});
  }
}