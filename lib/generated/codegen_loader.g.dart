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
    "resentCode": "تم ارسال كود التحقق",
    "passwordWeak": "كلمة المرور ضعيفة",
    "passwordMedium": "كلمة المرور متوسطة",
    "passwordStrong": "كلمة المرور قوية",
    "passwordVeryStrong": "كلمة المرور قوية جدا",
    "verifyCode": "تحقق من الكود",
    "enterCodeWeSentToYourEmail": "ادخل الكود الذي ارسلناه الى بريدك الالكتروني",
    "itsOkItHappensToTheBestOfUsEnterYourEmail": "لا عليك، يحدث هذا مع الجميع. ادخل بريدك الالكتروني وسنساعدك في استعادة حسابك",
    "weMayUserYourEmailAddressToSendYouVirifcationCode": "قد نستخدم عنوان بريدك الالكتروني لارسال كود التحقق"
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
    "any": "اي",
    "welcomeToWaselni": "مرحبا بك في وصلني",
    "yourFavoriteAppRightHere": "تطبيقك المفضل هنا",
    "startYourJourney": "ابدأ رحلتك من هنا !",
    "next": "التالي",
    "skip": "تخطي",
    "previous": "السابق",
    "done": "تم"
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
    "age": "العمر",
    "personalInfo": "المعلومات الشخصية",
    "joinUsToday": "انضم الينا اليوم",
    "location": "الموقع",
    "wehreAreYoulocated": "اين تسكن ؟",
    "waselniWillUseYourLocation": "سيستخدم تطبيق وصلني موقعك لتزويد برحلات و عروض خاصة لك",
    "byEnteringYourLocation": "من خلال ادخال موقعك فانك توافق على شروط خدمة تطبيق وصلني و تقر بان اشعار الخصوصية الخاص بنا يطبق"
  },
  "inputValidation": {
    "passwordLength": "يجب ان تكون كلمة المرور 6 احرف على الاقل",
    "passwordMatch": "كلمة المرور غير متطابقة",
    "emailExist": "البريد الالكتروني موجود بالفعل",
    "emailNotExist": "البريد الالكتروني غير موجود",
    "codeNotMatch": "الكود غير متطابق",
    "phoneLength": "رقم الهاتف يجب ان يكون 10 ارقام",
    "emailFormat": "البريد الالكتروني غير صحيح",
    "passwordFormat": "* يجب أن تحتوي كلمة المرور على حرف كبير وحرف صغير ورقم \n* وحرف خاص مثل @ \n* ويجب أن تكون مكونة من 8 أحرف على الأقل",
    "codeLength": "الكود يجب ان يكون 6 ارقام",
    "firstNameLength": "الاسم الاول يجب ان يكون 3 احرف على الاقل",
    "lastNameLength": "الاسم الاخير يجب ان يكون 3 احرف على الاقل",
    "addressLength": "العنوان يجب ان يكون 10 احرف على الاقل",
    "genderRequired": "الجنس مطلوب",
    "dateOfBirthRequired": "تاريخ الميلاد مطلوب",
    "nameFormat": "الاسم يجب ان يحتوي على حروف فقط",
    "cityRequired": "المدينة مطلوبة",
    "pleaseCheckThePoints": "يرجى تأكيد نقطة الانطلاق و الوصول"
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
    "bookingAddSuccess": "تم ارسال الحجز للسائق بنجاح"
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
    "or": "Or",
    "loginWithGoogle": "Login with Google",
    "weHaveSentCodeToYourEmail": "We have sent code to your email :",
    "resendCode": "Resend code",
    "resentCode": "Code sent Successfully",
    "passwordWeak": "Weak",
    "passwordMedium": "Medium",
    "passwordStrong": "Strong",
    "passwordVeryStrong": "Very Strong",
    "verifyCode": "Verify Code",
    "enterCodeWeSentToYourEmail": "Enter the code we sent to your email",
    "itsOkItHappensToTheBestOfUsEnterYourEmail": "It's ok, it happens to the best of us. Enter your email and we will help you recover your account",
    "weMayUserYourEmailAddressToSendYouVirifcationCode": "We may use your email address to send you a verification code"
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
    "any": "Any",
    "welcomeToWaselni": "Welcome to Waselni",
    "yourFavoriteAppRightHere": "Your favorite app right here",
    "startYourJourney": "Start your journey from here!",
    "next": "Next",
    "skip": "Skip",
    "previous": "Previous",
    "done": "Done"
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
    "age": "Age",
    "personalInfo": "Personal Information",
    "joinUsToday": "Join us today",
    "location": "Location",
    "wehreAreYoulocated": "Where are you located ?",
    "waselniWillUseYourLocation": "Waselni will use your location information to provide you with tailored services and features",
    "byEnteringYourLocation": "By entering you location, you are agreeing to Waselni’s Terms of Service and are acknowledging our Privacy Notice applies"
  },
  "inputValidation": {
    "passwordLength": "Password must be at least 6 characters",
    "passwordMatch": "Passwords do not match",
    "emailExist": "Email already exists",
    "emailNotExist": "Email does not exist",
    "codeNotMatch": "Code does not match",
    "phoneLength": "Phone number must be 10 digits",
    "emailFormat": "Invalid email format",
    "passwordFormat": "* Password must contain uppercase, lowercase, number, \n* and special character like @ \n* and be at least 8 characters",
    "codeLength": "Code must be 6 digits",
    "firstNameLength": "First name must be at least 3 characters",
    "lastNameLength": "Last name must be at least 3 characters",
    "addressLength": "Address must be at least 10 characters",
    "genderRequired": "Gender is required",
    "dateOfBirthRequired": "Date of birth is required",
    "nameFormat": "Name must contain only letters",
    "cityRequired": "City required",
    "pleaseCheckThePoints": "Please check start and end points"
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
    "bookingAddSuccess": "Booking sent to driver successfully"
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
