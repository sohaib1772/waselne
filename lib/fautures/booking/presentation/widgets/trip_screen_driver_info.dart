import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class TripScreenDriverInfo extends StatelessWidget {
  TripScreenDriverInfo({super.key,this.driverName,required this.driverId});
  String? driverName;
  int? driverId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () => AppRouter.routes.pushNamed(AppRouterNames.driverProfile,queryParameters: {"driverId": driverId.toString()??"0"}),
        child: Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),gradient: LinearGradient(colors: [
            Colors.pink.shade600,
            Colors.pink.shade300,
          ],begin: Alignment.bottomRight,end: Alignment.topLeft),),
          child: Column(
            children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                Row(
                  children: [
                   Icon(Icons.person),
                   Text(driverName ?? "",style: TextStyle(fontWeight: FontWeight.bold),),
                ]),
                
               
               ],
             ),
                   
             
            ],
          ),
        ),
      ),
    );
  }
}