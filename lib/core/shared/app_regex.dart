class AppRegex {
  static bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(password);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    return RegExp(r'^07[0-9]{9}$').hasMatch(phoneNumber);
  }

  static bool isValidName(String name) {
    return RegExp(r'^[a-zA-Z\u0600-\u06FF ]+$').hasMatch(name);
  }
}