import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool showConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppDividers.devider(height: 40),
          Text("auth.signUp".tr()),
          AppDividers.devider(height: 20),
          AppTextFormField(
            controller: emailController,
            hintText: LocaleKeys.auth_email.tr(),
            prefixIcon: Icons.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.errors_thisFieldIsRequired;
              }
              return null;
            },
          ),
          AppDividers.devider(height: 20),
          AppTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.errors_thisFieldIsRequired;
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
          AppTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.errors_thisFieldIsRequired;
              }
              return null;
            },
            controller: passwordConfirmController,
            isPassword: true,
            hintText: LocaleKeys.auth_confirmPassword.tr(),
            prefixIcon: Icons.password,
            showPassword: !showConfirmPassword,
            suffixIcon: IconButton(
              onPressed: () => setState(() => showConfirmPassword = !showConfirmPassword),
              icon: Icon(
                showConfirmPassword ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
        
          AppDividers.devider(height: 20),
          AppButtons.iconWithLabel(onPressed: (){
            if(formKey.currentState!.validate()){
              
            }
          },label: LocaleKeys.auth_signUp.tr(),icon: Icons.login),
          AppDividers.devider(height: 10),
          Text.rich(
            TextSpan(
              text: LocaleKeys.auth_alreadyHaveAccount.tr(),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = (){
                    AppRouter.routes.pop();
                  },
                  text: " ${LocaleKeys.auth_login.tr()}",
                  style: TextStyle(color: ColorScheme.of(context).secondary,fontWeight: FontWeight.bold),
                )
              ],
          ))
        ],
      ),
    );
  }
}
