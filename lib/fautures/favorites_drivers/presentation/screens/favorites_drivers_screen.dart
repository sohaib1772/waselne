import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/cubit/favorites_drivers_cubit.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/cubit/favorites_drivers_states.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/widgets/favorites_drivers_card.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class FavoritesDriversScreen extends StatelessWidget {
  FavoritesDriversScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      actions: [],
      title: LocaleKeys.main_favorites.tr(),
      body: BlocListener<FavoritesDriversCubit, FavoritesDriversStates>(
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
              if (state is FavoritesDriversLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is FavoritesDriversSuccess || state is FavoriteDriversRemoveSuccess) {
                return Column(
                  children: [
                    AppDividers.devider(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.main_favorites.tr(),
                            style: AppTextStyle.white16W900,
                          ),
                          AppDividers.devider(height: 5.h),
                          Container(
                            width: 40.w,
                            color: AppColors.teal,
                            height: 3,
                          ),
                        ],
                      ),
                    ),
                    AppDividers.devider(height: 15.h),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder:
                          (context, index) => AppDividers.devider(height: 10.h),
                      itemCount: context.read<FavoritesDriversCubit>().drivers.length ?? 0,
                      itemBuilder: (context, index) {
                        return FavoritesDriversCard(
                        driversModel: context.read<FavoritesDriversCubit>().drivers[index],
                        );
                      },
                    ),
                  ],
                );
              }

              return Center(
                child: Text(LocaleKeys.dioErrors_unknownError.tr()),
              );
            },
          ),
        ),
      ),
    );
  }
}
