import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_regex.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class NewPasswordFields extends StatefulWidget {
  NewPasswordFields({
    super.key,
    required this.passwordController,
    required this.passwordConfirmController,
  });
  TextEditingController passwordController;
  TextEditingController passwordConfirmController;
  @override
  State<NewPasswordFields> createState() => _NewPasswordFieldsState();
}

class _NewPasswordFieldsState extends State<NewPasswordFields> {
  bool showPassword = false;
  bool showConfirmPassword = false;
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        AppTextFormField(
          onChange: (text) {
            setState(() {
              password = text;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return LocaleKeys.errors_thisFieldIsRequired.tr();
            }
            if (!AppRegex.isValidPassword(value)) {
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
            icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
          ),
        ),
        AppDividers.devider(height: 10),

        AnimatedContainer(
          height: password != "" ? 50.h : 0.h,
          duration: const Duration(milliseconds: 500),
          child:
              password != ""
                  ? passwordStrengthIndicator(password)
                  : const SizedBox.shrink(),
        ),
        AppDividers.devider(height: 10),
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
                () =>
                    setState(() => showConfirmPassword = !showConfirmPassword),
            icon: Icon(
              showConfirmPassword ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      ],
    );
  }
}

Widget passwordStrengthIndicator(String password) {
  int strength = passwordStringth(password);
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            return Container(
              height: 4.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color:
                    index < strength
                        ? passwordStrengthColor(strength)
                        : Colors.grey,
              ),
            );
          }),
        ),
        AppDividers.devider(height: 5),
        Text(
          passwordStringthText(strength),
          style: AppTextStyle.white14SemiBold.copyWith(
            color: passwordStrengthColor(strength),
          ),
        ),
      ],
    ),
  );
}

int passwordStringth(String password) {
  int strength = 0;
  if (password.length >= 8) {
    strength += 1;
  }
  if (password.contains(RegExp(r'[A-Z]'))) {
    strength += 1;
  }
  if (password.contains(RegExp(r'[a-z]'))) {
    strength += 1;
  }
  if (password.contains(RegExp(r'[0-9]'))) {
    strength += 1;
  }
  if (password.contains(RegExp(r'[@$!%*?&]'))) {
    strength += 1;
  }
  return strength;
}

String passwordStringthText(int strength) {
  switch (strength) {
    case 1:
      return LocaleKeys.auth_passwordWeak.tr();
    case 2:
      return LocaleKeys.auth_passwordMedium.tr();
    case 3:
      return LocaleKeys.auth_passwordMedium.tr();
    case 4:
      return LocaleKeys.auth_passwordStrong.tr();
    case 5:
      return LocaleKeys.auth_passwordVeryStrong.tr();
    default:
      return LocaleKeys.auth_passwordWeak.tr();
  }
}

Color passwordStrengthColor(int strength) {
  switch (strength) {
    case 1:
      return AppColors.red;
    case 2:
      return AppColors.red;
    case 3:
      return AppColors.yallow;
    case 4:
      return AppColors.green;
    case 5:
      return AppColors.blue;
    default:
      return Colors.red;
  }
}
