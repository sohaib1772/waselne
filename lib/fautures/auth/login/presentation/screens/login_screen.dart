import 'package:auth_buttons/auth_buttons.dart';
import 'package:country_flags/country_flags.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_cubit/app_cubit.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/fautures/auth/login/presentation/widgets/login_form_widget.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
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
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoginFormWidget(),
                AppDividers.devider(height: 20),
                AppDividers.textDivider(text: "or".tr()),
                AppDividers.devider(height: 10),
                GoogleAuthButton(
                  text: LocaleKeys.auth_loginWithGoogle.tr(),
                  onPressed: () {},
                  style: AuthButtonStyle(
                    buttonType: AuthButtonType.secondary,
                    buttonColor: Colors.transparent,
                    elevation: 0,
                    textStyle: TextStyle(
                      color: ColorScheme.of(context).primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
