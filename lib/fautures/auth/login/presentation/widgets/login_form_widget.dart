import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/auth/login/presentation/cubit/login_cubit.dart';
import 'package:waselne/fautures/auth/login/presentation/cubit/login_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppDividers.devider(height: 40),
          Text("auth.login".tr()),
          AppDividers.devider(height: 20),
          Text(LocaleKeys.auth_email.tr(),style: AppTextStyle.white14W500,),
          AppDividers.devider(height: 5),
          AppTextFormField(
            controller: emailController,
            hintText: LocaleKeys.auth_email.tr(),
            prefixIcon: Icons.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.errors_thisFieldIsRequired.tr();
              }
              return null;
            },
          ),
          AppDividers.devider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(LocaleKeys.auth_password.tr(),style: AppTextStyle.white14W500,),
              TextButton(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.zero),
                  alignment: AlignmentDirectional.centerEnd,
                  minimumSize: WidgetStatePropertyAll(Size.zero),
                  fixedSize: WidgetStatePropertyAll(Size(double.infinity, 20.h)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap
                ),
                onPressed: () {
                  AppRouter.routes.pushNamed(AppRouterNames.changePassword,queryParameters: {"type":"checkEmail"});
                },
                child: Text(LocaleKeys.auth_forgotPassword.tr()),
              ),
            ],
          ),
          AppDividers.devider(height: 5),
          AppTextFormField(
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.errors_thisFieldIsRequired.tr();
              }
              return null;
            },
            controller: passwordController,
            isPassword: true,
            hintText: LocaleKeys.auth_password.tr(),
            prefixIcon: Icons.password,
            showPassword: !showPassword,
            suffixIcon: IconButton(
              onPressed: () => setState(() => showPassword = !showPassword),
              icon: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          
          AppDividers.devider(height: 20),
          BlocBuilder<LoginCubit,LoginStates>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return const CircularProgressIndicator();
              }
              return AppButtons.iconWithLabel(
                onPressed: () {
                  AppRouter.routes.pushReplacementNamed(AppRouterNames.main);
                  if (formKey.currentState!.validate()) {}
                },
                label: LocaleKeys.auth_login.tr(),
                icon: Icons.login,
              );
            },
          ),
          AppDividers.devider(height: 10),
          Text.rich(
            TextSpan(
              text: LocaleKeys.auth_dontHaveAccount.tr(),
              children: [
                TextSpan(
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          AppRouter.routes.pushNamed(AppRouterNames.signUp);
                        },
                  text: " ${LocaleKeys.auth_signUp.tr()}",
                  style: TextStyle(
                    color: ColorScheme.of(context).secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
