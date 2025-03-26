import 'package:auth_buttons/auth_buttons.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:waselne/core/helpers/google_sign_in/google_sign_in_helper.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/widgets/sign_up_form_widget.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [// make listner to state manage
                SvgPicture.asset("assets/svgs/logo.svg",height: 100.h,),
                SignUpFormWidget(),
                AppDividers.devider(height: 20),
                AppDividers.textDivider(text: LocaleKeys.auth_or.tr()),
                AppDividers.devider(height: 10),
                GoogleAuthButton(
                  text: LocaleKeys.auth_loginWithGoogle.tr(),
                  onPressed: () async{
                     final account = await GoogleSignInHelper.SignIn();
                   GoogleSignInAuthentication auth = await account!.authentication;
                   print("sos: ${auth.accessToken}");
                   print("sos: ${account.id}");
                   context.read<SignUpCubit>().loginWithGoogle(auth.accessToken ?? "");
                   await GoogleSignInHelper.SignOut();
                  },
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
