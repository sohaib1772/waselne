import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverBottomInfo extends StatelessWidget {
  const DriverBottomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [SizedBox(),  Text(
                "13",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
              ), Text("total trips")],
          ),
        ),
        Container(
          width: 100.w,
          height: 100.h,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text(
                "2",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
              ),
              Text("current trips"),
            ],
          ),
        ),
      ],
    );
  }
}
