import 'package:easy_localization/easy_localization.dart';

class AppFormater { // date from date picker
  static String appDateFormat(String date) => DateFormat("yyyy-MM-dd").format(DateTime.parse(date));
  static String dateFormat(String date) { // date from api
    DateTime parsedDate = DateFormat("yyyy-MM-dd hh:mm a").parse(date);
    return DateFormat("yyyy-MM-dd | h:mm").format(parsedDate);
  }

  static String moneyFormat(String money) =>
      NumberFormat("#,###").format(double.tryParse(money) ?? 0);
}
