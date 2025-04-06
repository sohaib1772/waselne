import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';
class AppFormater { // date from date picker
  static String appDateFormat(String date) => DateFormat("yyyy-MM-dd").format(DateTime.parse(date));
  static String dateFormat(String date) { // date from api
  try {
     String cleaned = date.trim().replaceAll('\u200F', ''); // يزيل رموز غريبة
    DateTime parsedDate = DateFormat("yyyy-MM-dd hh:mm a").parse(cleaned);
    return DateFormat("yyyy-MM-dd | h:mm a").format(parsedDate);
  } catch (e) {
    return "خطأ في التاريخ: \n$e";
  }
  }

  static String moneyFormat(String money) =>
      NumberFormat("#,###").format(double.tryParse(money) ?? 0);
}
