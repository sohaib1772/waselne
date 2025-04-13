import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/core/shared/models/cities_response_model.dart';
import 'package:waselne/core/shared/models/trip_model.dart';
import 'package:waselne/core/shared/shared_api/repositories/save_unsave_trips_repo.dart';
import 'package:waselne/fautures/home/data/home_repository_impl.dart';
import 'package:waselne/fautures/home/data/models/home_response_model.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this._homeRepository,this.saveUnsaveTripsRepo) : super(HomeInitialState()) {
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
  List<TripsDateGroupModel> trips = [];
  List<CityModel> cities = [];
  Map<String, dynamic> params = {};
  SaveUnsaveTripsRepo saveUnsaveTripsRepo;
  Future<void> getHomeData({bool resetPages = false}) async {
    // to reset the pages when the user apply filter
    if (resetPages) {
      trips.clear();
      nextPage = 1;
      emit(HomeFilterLoadingState());
    }

     // to prevent multiple requests at the same time
    if (!canRequest) return;
    canRequest = false;

    // when the user open the app for the first time and he didn't apply any filter
    // we need to get the cities first then get the home data
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

      // when user scroll to the end of the list and there is more data to show
      if ((result.data as HomeResponseModel).pagination!.totalPages! >=
          nextPage) {
        nextPage++;
        trips.addAll(result.data!.data!);
      } else {

        // when user scroll to the end of the list and there is no more data to show
        // we need to show the no more data to show state
        emit(HomeNoMoreDataToShowState());
        canRequest = true;
        return;
      }
      // make sure that the first time is false to prevent getting the cities again
      // and to prevent showing the loading state again
      firstTime = false;
      emit(HomeSuccessState(trips, result.data.pagination.total));

      // let the user scroll again to load more data
      // and make sure that the loading state is not shown again
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

  Future<void> saveTrip({required TripModel tripModel})async{
    emit(HomeSaveTripLoadingState(tripModel.id ?? 0));
    ApiResult result = await saveUnsaveTripsRepo.saveTrip({"tripId":tripModel.id});
    if(result.success!){
      tripModel.isSaved = 1;
      emit(HomeSaveTripSuccessState(result.message ?? ""));

    }else{
      emit(HomeErrorState(result.message ?? ""));
    }
  }
  Future<void> unSaveTrip({required TripModel tripModel,})async{
        emit(HomeSaveTripLoadingState(tripModel.id ?? 0));
    ApiResult result = await saveUnsaveTripsRepo.unSaveTrip({"tripId":tripModel.id});
    if(result.success!){
      tripModel.isSaved = 0;
      emit(HomeUnSaveTripSuccessState(result.message ?? ""));
    }else{
      emit(HomeErrorState(result.message ?? ""));
    }
  }
}
