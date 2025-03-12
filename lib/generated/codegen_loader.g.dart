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
    "loginWithGoogle": "تسجيل الدخول باستخدام جوجل",
    "weHaveSentCodeToYourEmail": " : تم ارسال الكود إلى بريدك الإلكتروني"
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
    "profile": "اعداد",
    "submit": "ارسال",
    "confirm": "تأكيد"
  },
  "personal": {
    "firstName": "الاسم الاول",
    "lastName": "الاسم الاخير",
    "phone": "رقم الهاتف",
    "address": "العنوان",
    "city": "المدينة",
    "country": "الدولة",
    "gender": "الجنس",
    "Male": "ذكر",
    "Female": "انثى",
    "dateOfBirth": "تاريخ الميلاد"
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
    "loginWithGoogle": "Login with Google",
    "weHaveSentCodeToYourEmail": "We have sent code to your email :"
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
    "profile": "Profile",
    "submit": "Submit",
    "confirm": "Confirm"
  },
  "personal": {
    "firstName": "First Name",
    "lastName": "Last Name",
    "phone": "Phone",
    "address": "Address",
    "city": "City",
    "country": "Country",
    "gender": "Gender",
    "Male": "Male",
    "Female": "Female",
    "dateOfBirth": "Date of Birth"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
