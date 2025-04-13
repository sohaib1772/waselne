import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/injection/di.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/cubit/favorites_drivers_cubit.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/screens/favorites_drivers_screen.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';
import 'package:waselne/fautures/home/presentation/screen/home_screen.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_states.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_cubit.dart';
import 'package:waselne/fautures/my_booking/presentation/screen/my_booking_screen.dart';
import 'package:waselne/fautures/my_save_trips/presentation/cubit/my_saved_trips_cubit.dart';
import 'package:waselne/fautures/my_save_trips/presentation/screen/my_saved_trips_screen.dart';
import 'package:waselne/fautures/profile/presentation/cubit/profile_cubit.dart';
import 'package:waselne/fautures/profile/presentation/screens/profile_screen.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitial());
  int screenIndex = 0;


  List<Widget> get screens => [
  BlocProvider(create: (context) => getIt<HomeCubit>()..getHomeData(), child:  HomeScreen()),
  BlocProvider(create: (context) => getIt<MyBookingCubit>()..getMyBooking(), child:  MyBookingScreen()),
  BlocProvider(create: (context) => getIt<FavoritesDriversCubit>()..getAllFavoritesDrivers(), child:  FavoritesDriversScreen()),
  BlocProvider(create: (context) => getIt<MySavedTripsCubit>()..getMySavedTrips(), child:  MySavedTripsScreen()),
  BlocProvider(create: (context) => getIt<ProfileCubit>(), child:  ProfileScreen()),
];
  void initScreenIndex(String? index){
    if(index != null)return;


    switch(index!){
      case AppRouterNames.home:
        screenIndex = 0;
        break;
      case AppRouterNames.myBooking:
        screenIndex = 1;
        break;
      case AppRouterNames.favoriteDrivers:
        screenIndex = 2;
        break;
      case AppRouterNames.mySavedTrips:
        screenIndex = 3;
        break;
      case AppRouterNames.ProfileScreen:
        screenIndex = 4;
        break;
      
    }
    
  }
  void changeScreen(int index){
    screenIndex = index;
    emit(MainChangeScreenState(index));
  }

  String lang = "en";

  void changeLanguage(BuildContext context, String locale) async {
    lang = locale;
    await context.setLocale(Locale(locale));
    await AppLocalStorage.secureStorage.write(key: AppLocalStorageKeys.lang, value: locale);
    emit(MainChangeLangState(Locale(locale)));

      // إصدار الحالة الجديدة بعد تغيير اللغة
  }
}

