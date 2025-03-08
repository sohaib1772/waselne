import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/theme/bottom_navigation_bars/main_bottom_navigation_bar.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_cubit.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      bottomNavigationBar: BlocBuilder<MainCubit,MainStates>(
        buildWhen: (previous, current) => current is MainChangeScreenState,
        builder: (context, state) {
        return MainBottomNavigationBar(cubit: context.read<MainCubit>(),);
      },),
      body: BlocBuilder<MainCubit, MainStates>(
        builder: (context, state) {
          switch(state){
            case MainChangeScreenState():
              return context.read<MainCubit>().screens[state.index];
            case MainInitial():
              return context.read<MainCubit>().screens[0];
            default:
              return Center(child: Text(LocaleKeys.errors_somethingWentWrong.tr()),);
          }
        },
      )
    );
  }
}