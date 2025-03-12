import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInHelper {

  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> SignIn() =>  _googleSignIn.signIn();
  static Future<void> SignOut() => _googleSignIn.signOut();
}
