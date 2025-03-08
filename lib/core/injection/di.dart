

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:waselne/core/network/dio_factory.dart';
import 'package:waselne/fautures/auth/login/data/api/login_api.dart';
import 'package:waselne/fautures/auth/login/data/login_repository_impl.dart';
import 'package:waselne/fautures/auth/login/presentation/cubit/login_cubit.dart';
import 'package:waselne/fautures/auth/sign_up/data/api/sign_up_api.dart';
import 'package:waselne/fautures/auth/sign_up/data/sign_up_repository_impl.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> diInit() async {
  Dio dio = await DioFactory.getDio() ;
  getIt.registerLazySingleton<Dio>(()=>dio);

  getIt.registerLazySingleton<LoginApi>(() => LoginApi(getIt()),);
  getIt.registerLazySingleton<LoginRepositoryImpl>(() => LoginRepositoryImpl(loginApi: getIt()),);
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()),);

  getIt.registerLazySingleton<SignUpApi>(() => SignUpApi(getIt()),);
  getIt.registerLazySingleton<SignUpRepositoryImpl>(() => SignUpRepositoryImpl(signUpApi: getIt()),);
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()),);

  getIt.registerFactory<MainCubit>(() => MainCubit(),);
}