import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/injection/di.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/cubit/favorites_drivers_cubit.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/screens/favorites_drivers_screen.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';
import 'package:waselne/fautures/home/presentation/screen/home_screen.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_states.dart';
import 'package:waselne/fautures/profile/presentation/cubit/profile_cubit.dart';
import 'package:waselne/fautures/profile/presentation/screens/profile_screen.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitial());

  int screenIndex = 0;

  List<Widget> screens = [];
  void initScreens(){
    screens = [
      BlocProvider(create: (context) => getIt<HomeCubit>()..getHomeData(),child: HomeScreen(),),
      BlocProvider(create: (context) => getIt<FavoritesDriversCubit>()..getAllFavoritesDrivers(),child: FavoritesDriversScreen(),),
      BlocProvider(create: (context) => getIt<ProfileCubit>(),child: ProfileScreen(),),
     
      
    ];
  }

  void changeScreen(int index){
    screenIndex = index;
    emit(MainChangeScreenState(index));
  }
}

