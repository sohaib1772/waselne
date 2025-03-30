

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:waselne/core/network/dio_factory.dart';
import 'package:waselne/fautures/auth/change_password/data/api/change_password_api.dart';
import 'package:waselne/fautures/auth/change_password/data/change_password_repository_impl.dart';
import 'package:waselne/fautures/auth/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:waselne/fautures/auth/code_verification/data/api/code_verification_api.dart';
import 'package:waselne/fautures/auth/code_verification/data/code_verification_repo_impl.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/cubit/code_verification_cubit.dart';
import 'package:waselne/fautures/auth/login/data/api/login_api.dart';
import 'package:waselne/fautures/auth/login/data/login_repository_impl.dart';
import 'package:waselne/fautures/auth/login/presentation/cubit/login_cubit.dart';
import 'package:waselne/fautures/auth/personal_info/data/api/personal_info_api.dart';
import 'package:waselne/fautures/auth/personal_info/data/personal_info_repo_impl.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_cubit.dart';
import 'package:waselne/fautures/auth/sign_up/data/api/sign_up_api.dart';
import 'package:waselne/fautures/auth/sign_up/data/sign_up_repository_impl.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:waselne/fautures/driver_profile/data/api/driver_profile_api.dart';
import 'package:waselne/fautures/driver_profile/data/driver_profile_repository.dart';
import 'package:waselne/fautures/driver_profile/presentation/cubit/driver_profile_cubit.dart';
import 'package:waselne/fautures/favorites_drivers/data/api/favorites_drivers_api.dart';
import 'package:waselne/fautures/favorites_drivers/data/favorites_drivers_repository.dart';
import 'package:waselne/fautures/favorites_drivers/presentation/cubit/favorites_drivers_cubit.dart';
import 'package:waselne/fautures/home/data/api/home_api.dart';
import 'package:waselne/fautures/home/data/home_repository_impl.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_cubit.dart';
import 'package:waselne/fautures/booking/data/api/booking_api.dart';
import 'package:waselne/fautures/booking/data/booking_repository.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_cubit.dart';
import 'package:waselne/fautures/my_booking/data/api/my_booking_api.dart';
import 'package:waselne/fautures/my_booking/data/my_booking_repository.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_cubit.dart';
import 'package:waselne/fautures/my_save_trips/data/api/my_saved_trips_api.dart';
import 'package:waselne/fautures/my_save_trips/data/my_saved_trips_repository.dart';
import 'package:waselne/fautures/my_save_trips/presentation/cubit/my_saved_trips_cubit.dart';
import 'package:waselne/fautures/notifications/data/notifications_channle.dart';
import 'package:waselne/fautures/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:waselne/fautures/profile/presentation/cubit/profile_cubit.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

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

  getIt.registerLazySingleton<CodeVerificationApi>(() => CodeVerificationApi(getIt()),);
  getIt.registerLazySingleton<CodeVerificationRepoImpl>(() => CodeVerificationRepoImpl(getIt()),);
  getIt.registerFactory<CodeVerificationCubit>(() => CodeVerificationCubit(getIt()),);

  getIt.registerLazySingleton<PersonalInfoApi>(() => PersonalInfoApi(getIt()),);
  getIt.registerLazySingleton<PersonalInfoRepoImpl>(() => PersonalInfoRepoImpl(getIt()),);
  getIt.registerFactory<PersonalInfoCubit>(() => PersonalInfoCubit(getIt()),);

  getIt.registerLazySingleton<ChangePasswordApi>(() => ChangePasswordApi(getIt()),);
  getIt.registerLazySingleton<ChangePasswordRepositoryImpl>(() => ChangePasswordRepositoryImpl(changePasswordApi: getIt()),);
  getIt.registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(getIt()),);

  getIt.registerLazySingleton<HomeApi>(() => HomeApi(getIt()),);
  getIt.registerLazySingleton<HomeRepositoryImpl>(() => HomeRepositoryImpl(getIt()),);
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()),);


  getIt.registerLazySingleton<BookingApi>(() => BookingApi(getIt()),);
  getIt.registerLazySingleton<BookingRepository>(() => BookingRepository(getIt()),);
  getIt.registerFactory<BookingCubit>(() => BookingCubit(getIt()),);

  getIt.registerLazySingleton<MyBookingApi>(() => MyBookingApi(getIt()),);
  getIt.registerLazySingleton<MyBookingRepository>(() => MyBookingRepository(getIt()),);
  getIt.registerFactory<MyBookingCubit>(() => MyBookingCubit(getIt()),);

  getIt.registerLazySingleton<MySavedTripsApi>(() => MySavedTripsApi(getIt()),);
  getIt.registerLazySingleton<MySavedTripsRepository>(() => MySavedTripsRepository(getIt()),);
  getIt.registerFactory<MySavedTripsCubit>(() => MySavedTripsCubit(getIt()),);

  getIt.registerLazySingleton<DriverProfileApi>(() => DriverProfileApi(getIt()),);
  getIt.registerLazySingleton<DriverProfileRepository>(() => DriverProfileRepository(driverProfileApi: getIt()),);
  getIt.registerFactory<DriverProfileCubit>(() => DriverProfileCubit(getIt()),);


  getIt.registerLazySingleton<FavoritesDriversApi>(() => FavoritesDriversApi(getIt()),);
  getIt.registerLazySingleton<FavoritesDriversRepository>(() => FavoritesDriversRepository(api:  getIt()),);
  getIt.registerFactory<FavoritesDriversCubit>(() => FavoritesDriversCubit(getIt()),);


  

  getIt.registerLazySingleton<NotificationsChannle>(() => NotificationsChannle(),);
  getIt.registerFactory<NotificationsCubit>(() => NotificationsCubit(getIt()),);

  
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(),);
}