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
      hasNotch: false,
      currentIndex: cubit.screenIndex,
      onTap: (index) {
          cubit.changeScreen(index);
      },
      items: [
        BottomBarItem(
          icon:  Icon(Icons.home,color: Theme.of(context).colorScheme.primary,),
          title: Text(LocaleKeys.main_home.tr(),style: TextStyle(color: Theme.of(context).colorScheme.primary),),
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        ),
        BottomBarItem(
          icon:  Icon(Icons.favorite,color: Theme.of(context).colorScheme.primary,),
          title:  Text(LocaleKeys.main_favorites.tr(),style: TextStyle(color: Theme.of(context).colorScheme.primary),),
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          
        ),
        BottomBarItem(
          icon:  Icon(Icons.account_box_rounded,color: Theme.of(context).colorScheme.primary,),
          title:  Text(LocaleKeys.main_profile.tr(),style: TextStyle(color: Theme.of(context).colorScheme.primary),),
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ],
      option: BubbleBarOptions(
        
      ),
    );
  }
}
