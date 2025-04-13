import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';

class AppFormater {
  // date from date picker
  static String appDateFormat(String date) =>
      DateFormat("yyyy-MM-dd").format(DateTime.parse(date));
  static String dateFormat(String date, String? locale) {
  try {
    locale = locale ?? 'en'; // default locale
    String cleaned = date.trim().replaceAll('\u200F', '');

    DateTime parsedDate;
    try {
      parsedDate = DateTime.parse(cleaned); // أكثر مرونة
    } catch (_) {
      parsedDate = DateFormat("yyyy-MM-dd").parse(cleaned);
    }

    return DateFormat("EEEE, yyyy MMMM dd", locale).format(parsedDate);
  } catch (e) {
    return "خطأ في التاريخ: \n$e";
  }
}

  static String moneyFormat(String money) =>
      NumberFormat("#,###").format(double.tryParse(money) ?? 0);

  static String ageFormat(String birthDateString) {
    String d = birthDateString.replaceFirst("Z", "");
    print("dddddddddddddddddd = $d");
    DateTime birthDate = DateTime.parse(birthDateString.replaceFirst("Z", ""));
    DateTime today = DateTime.now();

    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age.toString();
  }

  static String rateingFormatter(String rate) {
    if (rate.isEmpty) return "";
    return rate.substring(0, 3);
  }
}
