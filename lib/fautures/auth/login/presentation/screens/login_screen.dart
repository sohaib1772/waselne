import 'package:auth_buttons/auth_buttons.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:waselne/core/helpers/google_sign_in/google_sign_in_helper.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/entry_screens_header.dart';
import 'package:waselne/core/shared/lang_picker.dart';
import 'package:waselne/core/theme/buttons/app_auth_buttons.dart';

import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/auth/login/presentation/cubit/login_cubit.dart';
import 'package:waselne/fautures/auth/login/presentation/cubit/login_states.dart';
import 'package:waselne/fautures/auth/login/presentation/widgets/login_form_widget.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      showAppBar: false,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocListener<LoginCubit, LoginStates>(
            listener: (context, state) {
              if (state is LoginWithGoogleSuccess) {
                if (state.cities != null) {
                  AppRouter.routes.pushNamed(
                    AppRouterNames.personalInfo,
                    extra: state.cities,
                  );
                } else {
                  AppRouter.routes.goNamed(AppRouterNames.home);
                }
              } else if (state is LoginError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               entryScreensHeader(LocaleKeys.main_welcomeToWaselni.tr(), LocaleKeys.main_yourFavoriteAppRightHere.tr(),
                  dividerHeight: 40),
                LoginFormWidget(),
                AppDividers.devider(height: 20),
                AppDividers.textDivider(text: LocaleKeys.auth_or.tr()),
                AppDividers.devider(height: 10),
                AppAuthButtons.appAuthButton(() async {
                  final account = await GoogleSignInHelper.SignIn();
                  GoogleSignInAuthentication auth =
                      await account!.authentication;
                  print("sos: ${auth.accessToken}");
                  print("sos: ${account.id}");
                  context.read<LoginCubit>().loginWithGoogle(
                    auth.accessToken ?? "",
                  );
                  await GoogleSignInHelper.SignOut();
                }, type: AppAuthButtonsType.google),
                AppDividers.devider(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.auth_dontHaveAccount.tr(),
                      style: AppTextStyle.white14W500.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                    AppDividers.devider(width: 4),
                    TextButton(
                      onPressed: () {
                        AppRouter.routes.pushNamed(AppRouterNames.signUp);
                      },
                      child: Text(
                        LocaleKeys.auth_signUp.tr(),
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
