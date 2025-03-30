import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';

class DriverCustomersRatingSection extends StatefulWidget {
  DriverCustomersRatingSection({super.key});

  @override
  State<DriverCustomersRatingSection> createState() =>
      _DriverCustomersRatingSectionState();
}

class _DriverCustomersRatingSectionState
    extends State<DriverCustomersRatingSection> {
  double height = 180.h;
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          height = isOpen ? 180.h : 300.h;
          isOpen = !isOpen;
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.all(10.r),
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(10.r),
          color: isOpen ?  Theme.of(context).colorScheme.surfaceContainer:Theme.of(context).colorScheme.primaryContainer ,
        ),
        width: double.infinity,
        height: height,
        child: SingleChildScrollView(
          physics:
              isOpen
                  ? const BouncingScrollPhysics()
                  : NeverScrollableScrollPhysics(),

          child: Column(
            children: [
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return driverCustomerRatingItem(
                    context,
                    Random().nextInt(5),
                  );
                },
                separatorBuilder: (context, index) {
                  return AppDividers.devider(height: 10.h);
                },
                itemCount: 10,
              ),
              AppDividers.devider(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget driverCustomerRatingItem(BuildContext context, int rate) => Container(
  padding: EdgeInsets.all(4.r),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5.r),
    color: Theme.of(context).focusColor,
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "name",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          ),
          Row(
            children: List.generate(5, (index) {
              return rate < index
                  ? Icon(Icons.star, color: Colors.amber, size: 18.sp)
                  : Icon(
                    Icons.star_border_outlined,
                    color: Colors.amber,
                    size: 18.sp,
                  );
            }),
          ),
        ],
      ),
      Text(
        "lLorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet augue",
      ),
      AppDividers.devider(height: 10.h),
      Text("2025-03-23", style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
    ],
  ),
);
