import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_cubit/app_cubit.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/lang_picker.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:waselne/fautures/notifications/presentation/cubit/notifications_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class MainScaffold extends StatelessWidget {
   MainScaffold({super.key,required this.body,this.haveFloatingActionButton = false ,this.bottomNavigationBar,this.showAppBar = true});
   bool showAppBar;
  final Widget body;
  bool haveFloatingActionButton;
  Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:showAppBar ? AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actionsPadding: EdgeInsets.zero,

        backgroundColor: AppColors.darkBlue,
        toolbarHeight: 60.h,
        iconTheme: IconThemeData(
          color: ColorScheme.of(context).primary),
        actionsIconTheme: IconThemeData(
          color: ColorScheme.of(context).primary
        ),
        title: Text(
          "Waselni",          
        ),
        centerTitle: true,
        leading: Center(child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AppButtons.iconButton(onPressed: (){}, icon: Icons.menu_sharp),
          )),
        actions: [
          Center(child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: AppButtons.iconButton(onPressed: (){}, icon: Icons.search),
          ))
        ],
        
      ):null,
      body: body,
    
    );
  }
}