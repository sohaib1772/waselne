abstract class LoginRepository {
  Future<void> login(String email, String password);
  Future<void> loginViaGoogle(String email, String password);
}