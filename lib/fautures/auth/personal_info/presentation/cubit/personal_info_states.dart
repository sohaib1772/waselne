abstract class PersonalInfoStates {}

class PersonalInfoInitial extends PersonalInfoStates {}

class PersonalInfoLoading extends PersonalInfoStates {}

class PersonalInfoSuccess extends PersonalInfoStates {}

class PersonalInfoError extends PersonalInfoStates {
  String message;

  PersonalInfoError(this.message);
}