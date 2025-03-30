import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/cubit/favorites_drivers_cubit.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/cubit/favorites_drivers_states.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/widgets/favorites_drivers_card.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class FavoritesDriversScreen extends StatelessWidget {
  const FavoritesDriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoritesDriversCubit, FavoritesDriversStates>(
      listener: (context, state) {
        if (state is FavoritesDriversError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message ?? "")));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<FavoritesDriversCubit, FavoritesDriversStates>(
          builder: (context, state) {
            if(state is FavoritesDriversLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(state is FavoritesDriversSuccess){
              return Column(
              children: [
                FavoritesDriversCard(name: "name", id: 1),
                AppDividers.devider(height: 10.h),
                FavoritesDriversCard(name: "name1", id: 1),
                AppDividers.devider(height: 10.h),
                FavoritesDriversCard(name: "name2", id: 1),
                AppDividers.devider(height: 10.h),
                FavoritesDriversCard(name: "name3", id: 1),
              ],
            );

            }
           
            return Center(child: Text(LocaleKeys.dioErrors_unknownError.tr()));
          },
        ),
      ),
    );
  }
}
