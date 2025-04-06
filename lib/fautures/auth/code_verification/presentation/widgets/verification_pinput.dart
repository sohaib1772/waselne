import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class VerificationPinput extends StatelessWidget {
  VerificationPinput({super.key, required this.controller});
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      length: 6,
      defaultPinTheme: PinTheme(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteText,
        ),
      ),
      focusedPinTheme: PinTheme(
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteText,
        ),
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      submittedPinTheme: PinTheme(
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.teal,
        ),
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.teal),
          borderRadius: BorderRadius.circular(8),
          
        ),
      ),
      errorPinTheme: PinTheme(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty || value.length != 6) {
          return LocaleKeys.inputValidation_codeLength.tr();
        }

        return null;
      },
    );
  }
}
