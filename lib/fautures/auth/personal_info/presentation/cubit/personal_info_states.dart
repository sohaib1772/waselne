
import 'package:waselne/fautures/auth/personal_info/data/models/cities_response_model.dart';

abstract class PersonalInfoStates {}

class PersonalInfoInitial extends PersonalInfoStates {}

class PersonalInfoLoading extends PersonalInfoStates {}
class PersonalInfoGetCountriesLoading extends PersonalInfoStates {}

class PersonalInfoSuccess extends PersonalInfoStates {

}

class PersonalInfoGetCountriesSuccess extends PersonalInfoStates {
  final List<CityModel> countries;

  PersonalInfoGetCountriesSuccess(this.countries);
}

class PersonalInfoError extends PersonalInfoStates {
  String message;

  PersonalInfoError(this.message);
}