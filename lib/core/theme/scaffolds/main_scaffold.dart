import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_cubit/app_cubit.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/lang_picker.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/app_drawer.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:waselne/fautures/notifications/presentation/cubit/notifications_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

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
  final _advancedDrawerController = AdvancedDrawerController();
  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.veryDarkBlue
        ),
      ),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: context.locale.languageCode == "ar" ? true : false, 
      disabledGestures: false,
      openScale: 0.4,
      childDecoration:  BoxDecoration(
        border: Border.all(width: 2, color: AppColors.border),

      ),

      drawer: AppDrawer(advancedDrawerController: _advancedDrawerController,),
      child: Scaffold(
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
                            onPressed: _handleMenuButtonPressed,
                            icon: Icons.clear_all,
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
                                  context.locale.languageCode == "ar" ? 20 : 0,
                              right:
                                  context.locale.languageCode == "ar" ? 0 : 20,
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
      ),
    );
  }
}
