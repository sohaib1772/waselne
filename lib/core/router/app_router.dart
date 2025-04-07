import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waselne/core/injection/di.dart';
import 'package:waselne/core/router/app_router_animations.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/fautures/auth/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:waselne/fautures/auth/change_password/presentation/screens/change_password_screen.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/cubit/code_verification_cubit.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/screens/code_verification_screen.dart';
import 'package:waselne/fautures/auth/login/presentation/cubit/login_cubit.dart';
import 'package:waselne/fautures/auth/login/presentation/screens/login_screen.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/cities_response_model.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_cubit.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/screens/personal_info_screen.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:waselne/fautures/driver_profile/presentation/cubit/driver_profile_cubit.dart';
import 'package:waselne/fautures/driver_profile/presentation/screens/driver_profile_screen.dart';
import 'package:waselne/fautures/home/data/models/home_trip_model.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';
import 'package:waselne/fautures/home/presentation/screen/home_screen.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_cubit.dart';
import 'package:waselne/fautures/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_cubit.dart';
import 'package:waselne/fautures/booking/presentation/screen/trip_info_screen.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_cubit.dart';
import 'package:waselne/fautures/my_booking/presentation/screen/my_booking_edit_screen.dart';
import 'package:waselne/fautures/my_booking/presentation/screen/my_booking_screen.dart';
import 'package:waselne/fautures/my_save_trips/presentation/cubit/my_saved_trips_cubit.dart';
import 'package:waselne/fautures/my_save_trips/presentation/screen/my_saved_trips_screen.dart';
import 'package:waselne/fautures/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:waselne/fautures/notifications/presentation/screens/notifications_screen.dart';

class AppRouter {
  static final GoRouter routes = GoRouter(
    initialLocation: "/login",
    routes: [
      GoRoute(path: "/home",
          name: AppRouterNames.home,
          
          pageBuilder: (context, state) {
            return AppRouterAnimations.fadeAnimation(
              child: BlocProvider(
                create: (context) => getIt<HomeCubit>()..getHomeData(),
                child: HomeScreen(),
              ),
              state: state,
            );
          },
      ),
     GoRoute(
            path: "/notifications", // show trip details
            name: AppRouterNames.notifications,
            pageBuilder: (context, state) {
              var model = state.extra; // trip model
              return AppRouterAnimations.slideAnimation(
                child: BlocProvider(
                  create: (context) => getIt<NotificationsCubit>(),
                  child: NotificationsScreen(),
                ),
                state: state,
              );
            },
          ),
          GoRoute(
            path: "/trip-info", // show trip details
            name: AppRouterNames.tripInfo,
            pageBuilder: (context, state) {
              var model = state.extra; // trip model
              String date = state.uri.queryParameters["date"] ?? "0";
              return AppRouterAnimations.slideAnimation(
                child: BlocProvider(
                  create: (context) => getIt<BookingCubit>(),
                  child: TripInfoScreen(model: model,date: date,),
                ),
                state: state,
              );
            },
           
          ),
          GoRoute(
            path: "/driver-profile",
            name: AppRouterNames.driverProfile,
            pageBuilder: (context, state) {
              // int driverId = state.extra as int;
              var driverId = state.uri.queryParameters["driverId"] ?? "0";
              return AppRouterAnimations.fadeAnimation(
                child: BlocProvider(
                  create: (context) => getIt<DriverProfileCubit>(),
                  child: DriverProfileScreen(
                    model: int.tryParse(driverId) ?? 0,
                  ),
                ),
                state: state,
              );
            },
          ),
          GoRoute(
            path: "/my-booking",
            name: AppRouterNames.myBooking,
            pageBuilder: (context, state) {
              return AppRouterAnimations.fadeAnimation(
                child: BlocProvider(
                  create: (context) => getIt<MyBookingCubit>()..getMyBooking(),
                  child: MyBookingScreen(),
                ),
                state: state,
              );
            },
          ),
          GoRoute(
            path: "/my-booking-edit",
            name: AppRouterNames.myBookingEditScreen,
            pageBuilder: (context, state) {
              MyBookingModel model = state.extra as MyBookingModel;
              return AppRouterAnimations.fadeAnimation(
                child: BlocProvider(
                  create: (context) => getIt<MyBookingCubit>(),
                  child: MyBookingEditScreen(model: model),
                ),
                state: state,
              );
            },
          ),
          GoRoute(
            path: "/my-saved-trips",
            name: AppRouterNames.mySavedTrips,
            pageBuilder: (context, state) {
              return AppRouterAnimations.fadeAnimation(
                child: BlocProvider(
                  create:
                      (context) =>
                          getIt<MySavedTripsCubit>()..getMySavedTrips(),
                  child: MySavedTripsScreen(),
                ),
                state: state,
              );
            },
          ),
      GoRoute(
        path: "/login",
        name: AppRouterNames.login,
        pageBuilder: (context, state) {
          return AppRouterAnimations.fadeAnimation(
            child: BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: LoginScreen(),
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        path: "/signUp",
        name: AppRouterNames.signUp,
        pageBuilder: (context, state) {
          return AppRouterAnimations.fadeAnimation(
            child: BlocProvider(
              create: (context) => getIt<SignUpCubit>(),
              child: SignUpScreen(),
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        path: "/code-verification",
        name: AppRouterNames.codeVerification,
        builder: (context, state) {
          String? email = state.uri.queryParameters["email"];
          String? sendCode = state.uri.queryParameters["sendCode"];
          String? type = state.uri.queryParameters["type"];

          print("email: ${state.uri.queryParameters}");
          return BlocProvider(
            create:
                (context) =>
                    getIt<CodeVerificationCubit>()..resendCode(
                      email ?? "",
                      sendCode == null ? false : true,
                    ),
            child: CodeVerificationScreen(email: email ?? "", type: type ?? ""),
          );
        },
      ),
      GoRoute(
        path: "/personal-info",
        name: AppRouterNames.personalInfo,
        builder: (context, state) {
          String? token = state.uri.queryParameters["token"];
          List<CityModel> cities = state.extra as List<CityModel>;
          return BlocProvider(
            create: (context) => getIt<PersonalInfoCubit>(),
            child: PersonalInfoScreen(token: token, cities: cities),
          );
        },
      ),
      GoRoute(
        path: "/change-password",
        name: AppRouterNames.changePassword,
        builder: (context, state) {
          String? type = state.uri.queryParameters["type"];
          String? email = state.uri.queryParameters["email"];
          String? code = state.uri.queryParameters["code"];

          return BlocProvider(
            create: (context) => getIt<ChangePasswordCubit>(),
            child: ChangePasswordScreen(
              type: type ?? "",
              email: email ?? "",
              code: code,
            ),
          );
        },
      ),
    ],
  );
}
