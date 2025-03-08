import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_cubit.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class MainBottomNavigationBar extends StatelessWidget {
   MainBottomNavigationBar({super.key,required this.cubit});
  MainCubit cubit;
  @override
  Widget build(BuildContext context) {
    return StylishBottomBar(
      backgroundColor: ColorScheme.of(context).surface,
      fabLocation: StylishBarFabLocation.end,
      hasNotch: false,
      currentIndex: cubit.screenIndex,
      onTap: (index) {
          cubit.changeScreen(index);
      },
      items: [
        BottomBarItem(
          icon: const Icon(Icons.home),
          title: Text(LocaleKeys.main_home.tr()),
          backgroundColor: Colors.red,
          selectedIcon: const Icon(Icons.read_more),
        ),
        BottomBarItem(
          icon: const Icon(Icons.favorite),
          title:  Text(LocaleKeys.main_favorites.tr()),
          backgroundColor: Colors.orange,
        ),
        BottomBarItem(
          icon: const Icon(Icons.account_box_rounded),
          title:  Text(LocaleKeys.main_profile.tr()),
          backgroundColor: Colors.purple,
        ),
      ],
      option: DotBarOptions(
        dotStyle: DotStyle.tile,
        gradient: const LinearGradient(
          colors: [Colors.deepPurple, Colors.pink],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
