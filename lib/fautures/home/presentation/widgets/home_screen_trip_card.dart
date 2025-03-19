import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/fautures/home/data/models/home_trip_model.dart';

class HomeScreenTripCard extends StatelessWidget {
  HomeScreenTripCard({super.key, required this.model});
  HomeTripModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.routes.pushNamed(AppRouterNames.tripInfo, extra: model);
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).focusColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4.r, horizontal: 8.r),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      Text(
                        model.nameOfDriver ?? "",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bookmark_add_outlined),
                ),
              ],
            ),
            AppDividers.devider(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model.from ?? "",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppDividers.devider(width: 10),
                Icon(Icons.arrow_forward),
                AppDividers.devider(width: 10),
                Text(
                  model.to ?? "",
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            AppDividers.devider(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                      model.tripStart ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Colors.grey
                      ),
                    ),
                Text(
                  model.seatPrice.toString() ?? "",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
