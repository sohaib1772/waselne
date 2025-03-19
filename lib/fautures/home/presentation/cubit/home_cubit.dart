import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/fautures/home/data/home_repository_impl.dart';
import 'package:waselne/fautures/home/data/models/home_response_model.dart';
import 'package:waselne/fautures/home/data/models/home_trip_model.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this._homeRepository) : super(HomeInitialState()) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getHomeData();
      }
    });
  }
  HomeRepositoryImpl _homeRepository;
  ScrollController scrollController = ScrollController();
  int nextPage = 1;
  bool firstTime = true;
  bool canRequest = true;
  List<HomeTripModel> trips = [];
  void getHomeData() async {
    if (canRequest) {
      canRequest = false;
      if (firstTime) {
        emit(HomeLoadingState());
      }
      final result = await _homeRepository.getHomeData(nextPage: nextPage);
      if (result.success! == true) {
        if ((result.data as HomeResponseModel).pagination!.totalPages! >
            nextPage) {
          nextPage++;
          trips.addAll(result.data!.data!);
        }

        firstTime = false;

        emit(HomeSuccessState(trips));
        canRequest = true;
      } else {
        emit(HomeErrorState(result.message!));
        canRequest = true;
      }
    }
  }
}
