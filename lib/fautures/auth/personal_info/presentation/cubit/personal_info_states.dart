
import 'package:waselne/core/shared/models/cities_response_model.dart';

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