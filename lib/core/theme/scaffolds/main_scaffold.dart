import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:waselne/core/helpers/app_cubit/app_cubit.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/fautures/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:waselne/fautures/notifications/presentation/cubit/notifications_states.dart';

class MainScaffold extends StatelessWidget {
   MainScaffold({super.key,required this.body,this.haveFloatingActionButton = false ,this.bottomNavigationBar});
  final Widget body;
  bool haveFloatingActionButton;
  Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: bottomNavigationBar,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorScheme.of(context).primary),
        actionsIconTheme: IconThemeData(
          color: ColorScheme.of(context).primary
        ),
        actions: [
         
          IconButton(
            onPressed: () {
              context.read<AppCubit>().changeThemeMode();
            },
            icon: Icon(
              context.read<AppCubit>().isDark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
          CustomPopup(
            backgroundColor: ColorScheme.of(context).onSecondaryFixedVariant,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    AppRouter.routes.pop();
                    context.read<AppCubit>().changeLanguage(context, "ar");
                  },
                  child: CountryFlag.fromCountryCode('sa',width: 40,height: 30,)),
                AppDividers.devider(height: 10),
                InkWell(
                  onTap: () {
                    AppRouter.routes.pop();
                    context.read<AppCubit>().changeLanguage(context, "en");
                  },
                  child: CountryFlag.fromCountryCode('us',width: 40,height: 30,)),
              ],
            ),
            child: const Icon(Icons.language_outlined),
          ),
           AppDividers.devider(width: 10),
           
        
        ],
        leading: BlocBuilder<NotificationsCubit, NotificationsStates>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                if (state is NotificationsCount) {
                  AppRouter.routes.pushNamed(AppRouterNames.notifications);
                }
              },
              icon: Stack(
                children: [
                  const Icon(
                    Icons.notifications_outlined,
                    size: 30,
                  ),
                  if (state is NotificationsCount)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            state.count.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      )
                ]
              ),
            );
            
        },),
      ),
      body: body,
    );
  }
}