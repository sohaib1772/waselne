import 'package:auth_buttons/auth_buttons.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:waselne/core/helpers/google_sign_in/google_sign_in_helper.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/shared/widgets/entry_screens_header.dart';
import 'package:waselne/core/shared/widgets/lang_picker.dart';
import 'package:waselne/core/theme/buttons/app_auth_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/widgets/sign_up_form_widget.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      showAppBar: false,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [// make listner to state manage
              entryScreensHeader("Sign Up", "Your journey start here", dividerHeight: 40),
              SignUpFormWidget(),
              AppDividers.devider(height: 20),
              AppDividers.textDivider(text: LocaleKeys.auth_or.tr()),
              AppDividers.devider(height: 10),
              AppAuthButtons.appAuthButton(()async{
                final account = await GoogleSignInHelper.SignIn();
                 GoogleSignInAuthentication auth = await account!.authentication;
                 print("sos: ${auth.accessToken}");
                 print("sos: ${account.id}");
                 context.read<SignUpCubit>().loginWithGoogle(auth.accessToken ?? "");
                 await GoogleSignInHelper.SignOut();
              }, type: AppAuthButtonsType.google),
              AppDividers.devider(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.auth_alreadyHaveAccount.tr(),
                      style: AppTextStyle.white14W500.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                    AppDividers.devider(width: 4),
                    TextButton(
                      onPressed: () {
                        AppRouter.routes.pop();
                      },
                      child: Text(
                        LocaleKeys.auth_login.tr(),
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
    );
  }
}
