import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/fautures/driver_profile/presentation/cubit/driver_profile_cubit.dart';
import 'package:waselne/fautures/driver_profile/presentation/cubit/driver_profile_states.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_bottom_info.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_customers_rating_section.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_info.dart';

class DriverProfileScreen extends StatelessWidget {
  DriverProfileScreen({super.key, required this.driverId});
  int driverId;
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: BlocListener<DriverProfileCubit, DriverProfileStates>(
            listener: (context, state) {
              if (state is DriverProfileError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message ?? ""),
                ));
              }
            },
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  DriverInfo(),
                  AppDividers.devider(height: 30.h),
                  Text(
                    "Customers rating (35)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  AppDividers.devider(height: 10.h),
                  DriverCustomersRatingSection(),
                  AppDividers.devider(height: 10.h),
                  DriverBottomInfo(),
                  AppDividers.devider(height: 10.h),
                  AppButtons.iconWithLabel(
                    onPressed: () {
                      context.read<DriverProfileCubit>().addToFavorite(
                        driverId,
                      );
                    },
                    label: "Add To Favourites",
                    icon: Icons.favorite_border,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
