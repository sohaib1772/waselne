
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class MyBookingHelper {
  static String getStatus(String status) {
    switch (status) {
      case "pending":
        return LocaleKeys.myBookingInfo_pending.tr();
      case "accepted":
        return LocaleKeys.myBookingInfo_accepted.tr();
      case "rejected":
        return LocaleKeys.myBookingInfo_rejected.tr();
      default:
        return LocaleKeys.dioErrors_unknownError;
    }
  }

  static Color getStatusColor(String status) {
    switch (status) {
      case "pending":
        return Colors.amber;
      case "accepted":
        return Colors.green;
      case "rejected":
        return Colors.red;
      default:
        return Colors.amber;
    }
  }
}