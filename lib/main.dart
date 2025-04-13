import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_cubit/app_cubit.dart';
import 'package:waselne/core/helpers/app_cubit/app_states.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/helpers/app_secure/app_secure.dart';
import 'package:waselne/core/injection/di.dart';
import 'package:waselne/core/network/notifications_api.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/themes/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:waselne/firebase_options.dart';
import 'package:waselne/generated/codegen_loader.g.dart';

String lang = "en";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppLocalStorage.initSharedPrefrences();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationsApi.initNotifications();
  await diInit();
  await AppSecure.checkToken();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale("en"),
      assetLoader: CodegenLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: Size(393, 852),
      builder: (context, child) {
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Flutter Demo',
          themeMode: ThemeMode.dark,
          darkTheme: AppTheme.dark,
          theme: AppTheme.dark,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.routes,
        );
      },
    );
  }
}