import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/helpers/app_cubit/app_states.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  String lang = "en";

  void changeLanguage(BuildContext context, String locale) async {
    emit(AppChangeLanguageState(Locale(locale)));
    lang = locale;
    await context.setLocale(Locale(locale));
    await AppLocalStorage.secureStorage.write(key: AppLocalStorageKeys.lang, value: locale);
    emit(AppNormalState());
      // إصدار الحالة الجديدة بعد تغيير اللغة
  }
}