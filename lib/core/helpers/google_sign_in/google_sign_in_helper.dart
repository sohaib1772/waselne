import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInHelper {

  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> handleSignIn() =>  _googleSignIn.signIn();
}
