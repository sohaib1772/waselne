

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:waselne/core/network/dio_factory.dart';
import 'package:waselne/fautures/auth/login/data/api/login_api.dart';
import 'package:waselne/fautures/auth/login/data/login_repository_impl.dart';
import 'package:waselne/fautures/auth/login/presentation/cubit/login_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> diInit() async {
  Dio dio = await DioFactory.getDio() ;
  getIt.registerLazySingleton<Dio>(()=>dio);
  getIt.registerLazySingleton(() => LoginApi(dio),);
  getIt.registerLazySingleton(() => LoginRepositoryImpl(loginApi: getIt()),);
  getIt.registerFactory(() => LoginCubit(getIt()),);
}