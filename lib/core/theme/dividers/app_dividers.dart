import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDividers {
  static SizedBox devider({double height = 10,double width = 0}) {
    return  SizedBox(
      height: height.h,
      width: width.w,
    );
  }
  static Text textDivider({required String text}) {
    return  Text("ــــــــــــــــــــ $text ــــــــــــــــــــ");
  }
}