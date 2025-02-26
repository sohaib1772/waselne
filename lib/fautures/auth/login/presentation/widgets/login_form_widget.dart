import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppDividers.devider(height: 40),
          Text("auth.login".tr()),
          AppDividers.devider(height: 20),
          AppTextFormField(
            controller: emailController,
            hintText: LocaleKeys.auth_email.tr(),
            prefixIcon: Icons.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          AppDividers.devider(height: 20),
          AppTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(onPressed: (){}, child: Text(LocaleKeys.auth_forgotPassword.tr())),
            ],
          ),
          AppDividers.devider(height: 20),
          AppButtons.iconWithLabel(onPressed: (){
            if(formKey.currentState!.validate()){
              
            }
          },label: LocaleKeys.auth_login.tr(),icon: Icons.login),
          AppDividers.devider(height: 10),
          Text.rich(
            TextSpan(
              text: LocaleKeys.auth_dontHaveAccount.tr(),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = (){},
                  text: " ${LocaleKeys.auth_signUp.tr()}",
                  style: TextStyle(color: ColorScheme.of(context).secondary,fontWeight: FontWeight.bold),
                )
              ],
          ))
        ],
      ),
    );
  }
}
