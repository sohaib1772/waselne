

import 'package:waselne/fautures/auth/sign_up/data/api/sign_up_api.dart';
import 'package:waselne/fautures/auth/sign_up/domain/sign_up_repository.dart';

class SignUpRepositoryImpl  implements SignUpRepository{

  SignUpRepositoryImpl({required this.signUpApi});
  final SignUpApi signUpApi;
  @override
  Future<void> signUp(String email, String password) { // here it's should be return Future<LoginModel>
    return signUpApi.signUp({"email":email,"password":password});
  }


}