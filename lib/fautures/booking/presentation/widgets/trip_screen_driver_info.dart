import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class TripScreenDriverInfo extends StatelessWidget {
  TripScreenDriverInfo({super.key,this.driverName,this.driverPhone,this.driverRating,this.driverAboutMe});
  String? driverName;
  String? driverPhone;
  String? driverRating;
  String? driverAboutMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
              
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.r,horizontal: 8.r),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: Theme.of(context).colorScheme.surface),
                child: Row(
                  children: [
                   Icon(Icons.phone,size: 18,),
                   Text(" $driverPhone",style: TextStyle(fontWeight: FontWeight.bold),),
                ]),
              ),
             ],
           ),
           Row(
                children: [
                  Icon(Icons.star,color: Colors.amber,),
                  Text(driverRating ?? "",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
           AppDividers.devider(height: 10),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.driverInfo_aboutMe.tr(),style: TextStyle(fontWeight: FontWeight.bold),),
              AppDividers.devider(height: 10),
              Text("$driverAboutMe",),
            ]),
           
      
          ],
        ),
      ),
    );
  }
}