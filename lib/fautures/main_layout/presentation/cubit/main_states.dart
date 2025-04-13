import 'dart:ui';

sealed class MainStates {}

class MainInitial extends MainStates {}

class MainChangeScreenState extends MainStates {
  final int index;

  MainChangeScreenState(this.index);
}

class MainChangeLangState extends MainStates{
  Locale locale;
  MainChangeLangState(this.locale);
}
