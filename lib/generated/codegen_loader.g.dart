// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "appSettings": {
    "language": "اللغة",
    "english": "الانجليزية",
    "arabic": "العربية"
  },
  "auth": {
    "name": "الاسم",
    "email": "البريد الالكتروني",
    "password": "كلمة المرور",
    "confirmPassword": "تأكيد كلمة المرور",
    "alreadyHaveAccount": "لديك حساب بالفعل؟",
    "dontHaveAccount": "ليس لديك حساب؟",
    "login": "تسجيل الدخول",
    "signUp": "تسجيل",
    "forgotPassword": "نسيت كلمة المرور",
    "or": "أو",
    "loginWithGoogle": "تسجيل الدخول باستخدام جوجل"
  },
  "errors": {
    "email": "البريد الالكتروني غير صحيح",
    "password": "كلمة المرور غير صحيحة",
    "thisFieldIsRequired": "هذا الحقل مطلوب",
    "somethingWentWrong": "حدث خطأ ما"
  },
  "main": {
    "home": "الصفحة الرئيسية",
    "favorites": "المفضلة",
    "profile": "اعداد"
  }
};
static const Map<String,dynamic> _en = {
  "appSettings": {
    "language": "Language",
    "english": "English",
    "arabic": "Arabic"
  },
  "auth": {
    "name": "Name",
    "email": "Email",
    "password": "Password",
    "confirmPassword": "Confirm Password",
    "alreadyHaveAccount": "Already have an account?",
    "dontHaveAccount": "Don't have an account?",
    "login": "Login",
    "signUp": "Register",
    "forgotPassword": "Forgot Password",
    "or": "OR",
    "loginWithGoogle": "Login with Google"
  },
  "errors": {
    "email": "Invalid email",
    "password": "Invalid password",
    "thisFieldIsRequired": "This field is required",
    "somethingWentWrong": "Something went wrong"
  },
  "main": {
    "home": "Home",
    "favorites": "Favorites",
    "profile": "Profile"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
