import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_cubit/app_cubit.dart';
import 'package:waselne/core/helpers/app_cubit/app_states.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';

import 'package:waselne/core/theme/buttons/app_buttons.dart';

import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/fautures/main_layout/presentation/screens/main_layout_screen.dart';

class MainScaffold extends StatelessWidget {
  MainScaffold({
    super.key,
    required this.body,
    this.haveFloatingActionButton = false,
    this.bottomNavigationBar,
    this.showAppBar = true,
    this.actions,
    this.title,
    this.leading,
  });
  bool showAppBar;
  final Widget body;
  bool haveFloatingActionButton;
  Widget? bottomNavigationBar;
  List<Widget>? actions;
  Widget? leading;
  String? title;
  @override
  Widget build(BuildContext context) {
    return 
        
       Scaffold(
          appBar:
              showAppBar
                  ? AppBar(
                    automaticallyImplyLeading: false,
                    systemOverlayStyle: SystemUiOverlayStyle.light,
                    actionsPadding: EdgeInsets.zero,

                    backgroundColor: AppColors.darkBlue,
                    toolbarHeight: 60.h,
                    iconTheme: IconThemeData(
                      color: ColorScheme.of(context).primary,
                    ),
                    actionsIconTheme: IconThemeData(
                      color: ColorScheme.of(context).primary,
                    ),
                    title: Text(title ?? "Waselni"),
                    centerTitle: true,
                    leading: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: context.locale.languageCode == "ar" ? 0 : 20,
                          right: context.locale.languageCode == "ar" ? 20 : 0,
                        ),
                        child:
                            leading ??
                            AppButtons.iconButton(
                              onPressed: () {
                                advancedDrawerController.showDrawer();
                              },
                              icon: Icons.clear_all_sharp,
                            ),
                      ),
                    ),
                    actions:
                        actions ??
                        [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left:
                                    context.locale.languageCode == "ar"
                                        ? 20
                                        : 0,
                                right:
                                    context.locale.languageCode == "ar"
                                        ? 0
                                        : 20,
                              ),
                              child: AppButtons.iconButton(
                                onPressed: () {},
                                icon: Icons.search,
                              ),
                            ),
                          ),
                        ],
                  )
                  : null,
          body: body,
        );
  }
}
