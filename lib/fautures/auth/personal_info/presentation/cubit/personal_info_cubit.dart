import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/network/api_reasult.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/personal_info_model.dart';
import 'package:waselne/fautures/auth/personal_info/data/personal_info_repo_impl.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_states.dart';


class PersonalInfoCubit extends Cubit<PersonalInfoStates> {
  PersonalInfoCubit(this.personalInfoRepoImpl) : super(PersonalInfoInitial());
  final PersonalInfoRepoImpl personalInfoRepoImpl;

  Future<void> getCountries() async {
    emit(PersonalInfoGetCountriesLoading());
    ApiResult result = await personalInfoRepoImpl.getCountries();
    if (result.success! == true) {
      emit(PersonalInfoGetCountriesSuccess(result.data!));
    } else {
      emit(PersonalInfoError(result.message!));
    }
  }
  Future<void> createProfile(PersonalInfoModel body) async {
    emit(PersonalInfoLoading());
      ApiResult result = await personalInfoRepoImpl.createProfile(body);
    if (result.success! == true) {
      emit(PersonalInfoSuccess());
    } else {
      emit(PersonalInfoError(result.message!));
    }
  }
  

}
