import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/entry_screens_header.dart';
import 'package:waselne/core/shared/lang_picker.dart';

import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/auth/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:waselne/fautures/auth/change_password/presentation/cubit/change_password_states.dart';
import 'package:waselne/fautures/auth/change_password/presentation/widgets/change_password_check_email.dart';
import 'package:waselne/fautures/auth/change_password/presentation/widgets/change_password_new_passowrd.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key, required this.type, this.email, this.code});

  String type;
  String? email;
  String? code;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      showAppBar: false,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocListener<ChangePasswordCubit, ChangePasswordStates>(
            listener: (context, state) {
              if (state is ChangePasswordCheckEmailSuccess) {
                AppRouter.routes.pushNamed(
                  AppRouterNames.codeVerification,
                  queryParameters: {
                    "type": "password",
                    "email": emailController.text,
                  },
                );
              } else if (state is ChangePasswordError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is ChangePasswordSuccess) {
                AppRouter.routes.goNamed(AppRouterNames.login);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                entryScreensHeader(
                  LocaleKeys.auth_forgotPassword.tr(),
                  LocaleKeys.auth_itsOkItHappensToTheBestOfUsEnterYourEmail.tr(),
                ),

                type == "checkEmail"
                    ? ChangePasswordCheckEmail(emailController: emailController)
                    : ChangePasswordNewPassowrd(email: email ?? "", code: code),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
