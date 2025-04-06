import 'package:flutter/widgets.dart';

abstract class AppStates{} 

class AppInitialState extends AppStates{}


class AppChangeLanguageState extends AppStates{
  Locale locale;
  AppChangeLanguageState(this.locale);
}