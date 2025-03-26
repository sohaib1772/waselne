import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';

class DriverInfo extends StatelessWidget {
  const DriverInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: Theme.of(context).colorScheme.primaryContainer),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Name"),
            Text("07734326683"),
          ],
        ),
        AppDividers.devider(height: 10.h),
        Text("about me",style: TextStyle(fontWeight: FontWeight.bold),),
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet augue nec magna luctus commodo sed at felis. Quisque in nisl convallis, iaculis augue condimentum,"),
        AppDividers.devider(height: 10.h),
        Row(
          children: [
            Icon(Icons.star,color: Colors.amber,),
            Text("3.4",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),)
          ],
        )
        

      ]),);
  }
}