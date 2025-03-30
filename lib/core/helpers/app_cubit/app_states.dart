import 'package:flutter/widgets.dart';

abstract class AppStates{} 

class AppInitialState extends AppStates{}

class AppChangeThemeModeState extends AppStates{
  bool isDark;
  AppChangeThemeModeState(this.isDark);
}
class AppChangeLanguageState extends AppStates{
  Locale locale;
  AppChangeLanguageState(this.locale);
}