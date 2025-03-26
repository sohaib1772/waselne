import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/cities_response_model.dart';
import 'package:waselne/fautures/home/data/home_repository_impl.dart';
import 'package:waselne/fautures/home/data/models/home_cities_model.dart';
import 'package:waselne/fautures/home/data/models/home_response_model.dart';
import 'package:waselne/fautures/home/data/models/home_trip_model.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this._homeRepository) : super(HomeInitialState()) {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await getHomeData();
      }
    });
  }
  HomeRepositoryImpl _homeRepository;
  ScrollController scrollController = ScrollController();
  int nextPage = 1;
  bool firstTime = true;
  bool canRequest = true;
  List<HomeTripModel> trips = [];
  List<CityModel> cities = [];
  Map<String, dynamic> params = {};
  Future<void> getHomeData({bool resetPages = false}) async {
    if (resetPages) {
      trips.clear();
      nextPage = 1;
      emit(HomeFilterLoadingState());
    }
    if (!canRequest) return;
    canRequest = false;

    if (firstTime) {
      emit(HomeLoadingState());
      bool isGettingCities = await getCities();
      if (!isGettingCities) {
        canRequest = true;
        return;
      }
    }
    final result = await _homeRepository.getHomeData(
      nextPage: nextPage,
      params: params,
    );
    if (result.success! == true) {
      if ((result.data as HomeResponseModel).pagination!.totalPages! >=
          nextPage) {
        nextPage++;
        trips.addAll(result.data!.data!);
      } else {
        emit(HomeNoMoreDataToShowState());
        canRequest = true;
        return;
      }

      firstTime = false;
      emit(HomeSuccessState(trips, result.data.pagination.total));
      canRequest = true;
    } else {
      emit(HomeErrorState(result.message!));
      canRequest = true;
    }
  }

  Future<bool> getCities() async {
    ApiResult result = await _homeRepository.getCities();
    if (result.success! == true) {
      cities = result.data ?? [];
      return true;
    } else {
      emit(HomeErrorState(result.message!));
      return false;
    }
  }
}
