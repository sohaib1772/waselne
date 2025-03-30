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
    "weHaveSentCodeToYourEmail": " : تم ارسال كود التحقق إلى بريدك الإلكتروني",
    "resendCode": "اعادة ارسال الكود",
    "resentCode": "تم ارسال كود التحقق"
  },
  "errors": {
    "email": "البريد الالكتروني غير صحيح",
    "password": "كلمة المرور غير صحيحة",
    "thisFieldIsRequired": "هذا الحقل مطلوب",
    "somethingWentWrong": "حدث خطأ ما"
  },
  "main": {
    "home": "الرئيسية",
    "favorites": "المفضلة",
    "profile": "اعداد",
    "submit": "ارسال",
    "confirm": "تأكيد",
    "search": "بحث",
    "cancel": "الغاء",
    "tryAgain": "اعادة المحاولة",
    "areYouSure": "هل انت متاكد؟",
    "any": "اي"
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
    "dateOfBirth": "تاريخ الميلاد",
    "name": "الاسم",
    "age": "العمر"
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
  },
  "dioErrors": {
    "connectionTimeout": "انتهت مهلة الاتصال",
    "sendTimeout": "انتهت مهلة الارسال",
    "receiveTimeout": "انتهت مهلة الاستقبال",
    "badCertificate": "شهادة خاطئة",
    "badResponse": "استجابة خاطئة",
    "cancel": "تم الغاء الطلب",
    "connectionError": "خطأ في الاتصال",
    "notFound": "غير موجود",
    "unauthorized": "غير مصرح به",
    "forbidden": "ممنوع",
    "internalServerError": "خطأ داخلي في الخادم",
    "unknownError": "خطأ غير معروف",
    "validationOccurred": "حدث خطأ في التحقق من البيانات",
    "tooManyRequests": "طلبات كثيرة يرجى المحاولة لاحقا"
  },
  "tripInfo": {
    "info": "معلومات الرحلة",
    "tripDate": "تاريخ الرحلة",
    "tripTime": "وقت الرحلة",
    "tripPrice": "سعر المقعد",
    "tripType": "نوع الرحلة",
    "tripStatus": "حالة الرحلة",
    "tripStart": "نقطة الانطلاق",
    "tripEnd": "نقطة الوصول",
    "tripDetails": "تفاصيل الرحلة",
    "tripDriver": "السائق",
    "drivePhone": "رقم الهاتف",
    "bookingNow": "حجز الان",
    "saveLater": "حفظ لاحقا",
    "seatCount": "عدد المقاعد",
    "avilableSeats": "المقاعد المتاحة",
    "totalPrice": "السعر الكلي",
    "bookingAddSuccess": "تم اضافة الحجز بنجاح"
  },
  "driverInfo": {
    "driverInfo": "معلومات السائق",
    "driverName": "اسم السائق",
    "driverPhone": "رقم الهاتف",
    "driverEmail": "البريد الالكتروني",
    "numberOfTrips": "عدد الرحلات",
    "rating": "التقييم",
    "aboutMe": "نبذة"
  },
  "profileInfo": {
    "profileInfo": "معلومات الملف الشخصي",
    "updateProfile": "تحديث الملف الشخصي",
    "updateProfileSuccess": "تم تحديث الملف الشخصي بنجاح",
    "favoritesUsers": "المفضلين",
    "myBooking": "حجوزاتي",
    "myTrips": "رحلاتي",
    "savedTrips": "المحفوظة"
  },
  "myBookingInfo": {
    "bookID": "رقم الحجز",
    "status": "حالة الحجز",
    "bookingDate": "تاريخ الرحلة",
    "bookingPrice": "السعر الاجمالي",
    "tripType": "نوع الرحلة",
    "bookingStart": "نقطة الانطلاق",
    "bookingEnd": "نقطة الوصول",
    "bookingDetails": "تفاصيل",
    "tripDriver": "السائق",
    "bookSeatNumber": "عدد المقاعد",
    "editBooking": "تعديل الحجز",
    "cancelBooking": "الغاء الحجز",
    "pending": "قيد المراجعة",
    "accepted": "مقبول",
    "rejected": "مرفوض"
  },
  "others": {
    "city": "المدينة"
  },
  "home": {
    "cityStart": "من",
    "cityEnd": "الى",
    "date": "التاريخ",
    "time": "الوقت",
    "search": "بحث",
    "tripType": "نوع الرحلة",
    "tripDate": "تاريخ الرحلة",
    "tripPrice": "سعر المقعد",
    "noData": "لا يوجد رحلات متاحة",
    "citiesShouldBeDifferent": "المدن يجب ان تكون مختلفة",
    "availableSeats": "المقاعد المتاحة",
    "reasultsCount": "عدد النتائج",
    "theresNoMoreData": "لا يوجد المزيد من البيانات"
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
    "weHaveSentCodeToYourEmail": "We have sent code to your email :",
    "resendCode": "Resend code",
    "resentCode": "Code sent Successfully"
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
    "confirm": "Confirm",
    "search": "Search",
    "cancel": "Cancel",
    "tryAgain": "Try Again",
    "areYouSure": "Are you sure?",
    "any": "Any"
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
    "dateOfBirth": "Date of Birth",
    "name": "Name",
    "age": "Age"
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
  },
  "dioErrors": {
    "connectionTimeout": "Connection timeout",
    "sendTimeout": "Send timeout",
    "receiveTimeout": "Receive timeout",
    "badCertificate": "Bad certificate",
    "badResponse": "Bad response",
    "cancel": "Request canceled",
    "connectionError": "Connection error",
    "notFound": "Not found",
    "unauthorized": "Unauthorized",
    "forbidden": "Forbidden",
    "internalServerError": "Internal server error",
    "unknownError": "Unknown error",
    "validationOccurred": "Validation occurred",
    "tooManyRequests": "Too many requests, please try again later"
  },
  "tripInfo": {
    "info": "Trip Info",
    "tripDate": "Trip Start",
    "tripTime": "Trip Time",
    "tripPrice": "Seat Price",
    "tripType": "Trip Type",
    "tripStatus": "Trip Status",
    "tripStart": "Start Point",
    "tripEnd": "End Point",
    "tripDetails": "Trip Details",
    "tripDriver": "Trip Driver",
    "drivePhone": "Driver Phone",
    "bookingNow": "Book Now",
    "saveLater": "Save Trip",
    "seatCount": "Number of Seats You Want",
    "avilableSeats": "Available Seats",
    "totalPrice": "Total Price",
    "bookingAddSuccess": "Booking added successfully"
  },
  "driverInfo": {
    "driverInfo": "Driver Info",
    "driverName": "Driver Name",
    "driverPhone": "Driver Phone",
    "driverEmail": "Driver Email",
    "numberOfTrips": "Number of Trips",
    "rating": "Rating",
    "aboutMe": "About me"
  },
  "profileInfo": {
    "profileInfo": "Profile Info",
    "updateProfile": "Update Profile",
    "updateProfileSuccess": "Profile updated successfully",
    "favoritesUsers": "Favorites",
    "myBooking": "Bookings",
    "myTrips": "My Trips",
    "savedTrips": "Saved Trips"
  },
  "myBookingInfo": {
    "bookID": "Booking ID",
    "status": "Status",
    "bookingDate": "Trip Date",
    "bookingPrice": "Total Price",
    "tripType": "Type",
    "bookingStart": "Start Point",
    "bookingEnd": "End Point",
    "bookingDetails": "Details",
    "tripDriver": "Driver",
    "bookSeatNumber": "Number of Seats",
    "editBooking": "Edit Booking",
    "cancelBooking": "Cancel Booking",
    "pending": "Pending",
    "accepted": "Accepted",
    "rejected": "Rejected"
  },
  "others": {
    "city": "City"
  },
  "home": {
    "cityStart": "From",
    "cityEnd": "To",
    "date": "Date",
    "time": "Time",
    "search": "Search",
    "tripType": "Trip Type",
    "tripDate": "Trip Date",
    "tripPrice": "Seat Price",
    "noData": "No trips available",
    "citiesShouldBeDifferent": "Cities should be different",
    "availableSeats": "Available Seats",
    "reasultsCount": "Results Count",
    "theresNoMoreData": "There is no more data"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
