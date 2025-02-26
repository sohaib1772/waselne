import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waselne/core/injection/di.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/fautures/auth/login/presentation/cubit/login_cubit.dart';
import 'package:waselne/fautures/auth/login/presentation/screens/login_screen.dart';
import 'package:waselne/fautures/main_layout/presentation/screens/main_layout_screen.dart';

class AppRouter {
  static final GoRouter routes = GoRouter(
    initialLocation: "/login",
    routes: [
      GoRoute(
        path: "/main",
        name: AppRouterNames.main,
        builder: (context, state) => const MainLayoutScreen(),
      ),
      GoRoute(
        path: "/login",
        name: AppRouterNames.login,
        builder:
            (context, state) =>
                BlocProvider(create: (context) => getIt<LoginCubit>(),child: LoginScreen(),),
      ),
    ],
  );
}
