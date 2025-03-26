import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';

class FavoritesDriversCard extends StatelessWidget {
   FavoritesDriversCard({super.key,required this.name,required this.id});
String name;
int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppRouter.routes.pushNamed(AppRouterNames.driverProfile,queryParameters: {"driverId": id.toString()}),
      child: Container(
        padding: EdgeInsets.all(10.r),
        width: double.infinity,
        alignment: AlignmentDirectional.centerStart,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        child: Text(name,style: TextStyle(fontSize: 20.sp),),
      ),
    );
  }
}