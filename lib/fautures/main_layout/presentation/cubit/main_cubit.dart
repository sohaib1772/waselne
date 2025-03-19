import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/injection/di.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';
import 'package:waselne/fautures/home/presentation/screen/home_screen.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitial());

  int screenIndex = 0;

  List<Widget> screens = [];
  void initScreens(){
    screens = [
      BlocProvider(create: (context) => getIt<HomeCubit>()..getHomeData(),child: HomeScreen(),),
      Center(child: Text("favorites"),),
      Center(child: Text("profile"),),
    ];
  }

  void changeScreen(int index){
    screenIndex = index;
    emit(MainChangeScreenState(index));
  }
}

