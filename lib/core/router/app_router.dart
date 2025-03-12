import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waselne/core/injection/di.dart';
import 'package:waselne/core/router/app_router_animations.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/cubit/code_verification_cubit.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/screens/code_verification_screen.dart';
import 'package:waselne/fautures/auth/login/presentation/cubit/login_cubit.dart';
import 'package:waselne/fautures/auth/login/presentation/screens/login_screen.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_cubit.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/screens/personal_info_screen.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:waselne/fautures/main_layout/presentation/cubit/main_cubit.dart';
import 'package:waselne/fautures/main_layout/presentation/screens/main_layout_screen.dart';

class AppRouter {
  static final GoRouter routes = GoRouter(
    initialLocation: "/login",
    routes: [
      GoRoute(
        path: "/main",
        name: AppRouterNames.main,
        pageBuilder: (context, state) {
          return AppRouterAnimations.fadeAnimation(
            child: BlocProvider(
              create: (context) => getIt<MainCubit>()..initScreens(),
              child: MainLayoutScreen(),
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        path: "/login",
        name: AppRouterNames.login,
        pageBuilder: (context, state) {
          return AppRouterAnimations.slideAnimation(
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
          return AppRouterAnimations.slideAnimation(
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
          print("email: ${state.uri.queryParameters}");
          return BlocProvider(create: (context) => getIt<CodeVerificationCubit>(), child: CodeVerificationScreen(email: email ?? "email not found",));
        },
      ),
      GoRoute(
        path: "/personal-info",
        name: AppRouterNames.personalInfo,
        builder: (context, state) {
          String? token = state.uri.queryParameters["token"];
          return BlocProvider(create: (context) => getIt<PersonalInfoCubit>()..getCountries(), child: PersonalInfoScreen(token: token,));
        },
      ),
    ],
  );
}
