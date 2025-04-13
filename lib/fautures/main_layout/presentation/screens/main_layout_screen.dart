import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/helpers/app_secure/app_secure.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/bottom_navigation_bars/main_bottom_navigation_bar.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/drawer/app_drawer.dart';
import 'package:waselne/core/theme/drawer/drawer_buttons.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_cubit.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';
  final advancedDrawerController = AdvancedDrawerController();

class MainLayoutScreen extends StatelessWidget {
  MainLayoutScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: advancedDrawerController,
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: AppColors.veryDarkBlue),
      ),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: context.locale.languageCode == "ar" ? true : false,
      disabledGestures: false,

      openScale: 0.4,
      childDecoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.border),
      ),

      drawer: BlocBuilder<MainCubit, MainStates>(
        builder: (context, state) {
          return AppDrawer(advancedDrawerController: advancedDrawerController);
        },
      ),
      child: BlocBuilder<MainCubit, MainStates>(
          builder: (context, state) {
            
            return context.read<MainCubit>().screens[context
                .read<MainCubit>()
                .screenIndex];
          },
        )
            
      
    );
  }
}
