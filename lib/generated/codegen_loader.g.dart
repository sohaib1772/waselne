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
  },
  "inputValidation": {
    "passwordLength": "يجب ان تكون كلمة المرور 6 احرف على الاقل",
    "passwordMatch": "كلمة المرور غير متطابقة",
    "emailExist": "البريد الالكتروني موجود بالفعل",
    "emailNotExist": "البريد الالكتروني غير موجود",
    "codeNotMatch": "الكود غير متطابق",
    "phoneLength": "رقم الهاتف يجب ان يكون 10 ارقام",
    "emailFormat": "البريد الالكتروني غير صحيح",
    "passwordFormat": "كلمة المرور يجب ان تحتوي على حرف كبير \n وصغير ورقم و علامة مثل @ و تكون على الاقل 8 احرف",
    "codeLength": "الكود يجب ان يكون 6 ارقام",
    "firstNameLength": "الاسم الاول يجب ان يكون 3 احرف على الاقل",
    "lastNameLength": "الاسم الاخير يجب ان يكون 3 احرف على الاقل",
    "addressLength": "العنوان يجب ان يكون 10 احرف على الاقل",
    "genderRequired": "الجنس مطلوب",
    "dateOfBirthRequired": "تاريخ الميلاد مطلوب",
    "nameFormat": "الاسم يجب ان يحتوي على حروف فقط"
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
  },
  "inputValidation": {
    "passwordLength": "Password must be at least 6 characters",
    "passwordMatch": "Passwords do not match",
    "emailExist": "Email already exists",
    "emailNotExist": "Email does not exist",
    "codeNotMatch": "Code does not match",
    "phoneLength": "Phone number must be 10 digits",
    "emailFormat": "Invalid email format",
    "passwordFormat": "Password must contain uppercase, lowercase, number, \n and special character like @ and be at least 8 characters",
    "codeLength": "Code must be 6 digits",
    "firstNameLength": "First name must be at least 3 characters",
    "lastNameLength": "Last name must be at least 3 characters",
    "addressLength": "Address must be at least 10 characters",
    "genderRequired": "Gender is required",
    "dateOfBirthRequired": "Date of birth is required",
    "nameFormat": "Name must contain only letters"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
