import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waselne/core/shared/app_regex.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class NewPasswordFields extends StatefulWidget {
   NewPasswordFields({super.key ,required this.passwordController,required this.passwordConfirmController});
  TextEditingController passwordController;
  TextEditingController passwordConfirmController;
  @override
  State<NewPasswordFields> createState() => _NewPasswordFieldsState();
}

class _NewPasswordFieldsState extends State<NewPasswordFields> {
  bool showPassword = false;
  bool showConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.errors_thisFieldIsRequired.tr();
                }
                if(!AppRegex.isValidPassword(value)){
                  return LocaleKeys.inputValidation_passwordFormat.tr();
                }
                return null;
              },
              controller: widget.passwordController,
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
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value != widget.passwordController.text) {
                  return LocaleKeys.inputValidation_passwordMatch.tr();
                }
                return null;
              },
              controller: widget.passwordConfirmController,
              isPassword: true,
              hintText: LocaleKeys.auth_confirmPassword.tr(),
              prefixIcon: Icons.password,
              showPassword: !showConfirmPassword,
              suffixIcon: IconButton(
                onPressed:
                    () => setState(
                      () => showConfirmPassword = !showConfirmPassword,
                    ),
                icon: Icon(
                  showConfirmPassword ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
      ],
    );
  }
}