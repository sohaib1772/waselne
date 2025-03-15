import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class VerificationPinput extends StatelessWidget {
   VerificationPinput({super.key,required this.controller});
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      length: 6,
      defaultPinTheme: PinTheme(
        width: 30,
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Colors.grey.shade300,
          )),
        ),
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 34,
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Colors.grey.shade300,
          )),

        )),
        submittedPinTheme: PinTheme(
          width: 34,
          height: 50,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: Colors.lightGreen,
              )),

          )),
          errorPinTheme: PinTheme(
            width: 30,
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Colors.red,
                )),

            )),
   validator: (value) {
      if (value == null || value.isEmpty || value.length != 6) {
        return LocaleKeys.inputValidation_codeLength.tr();
      }
     
      return null;
   },
    );
  }
}