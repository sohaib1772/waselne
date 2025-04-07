import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_regex.dart';
import 'package:waselne/core/shared/date_picker.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_cubit.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/widgets/personal_info_select_gender.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/widgets/personal_info_up_bar.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class PersonalInfoFirstWidget extends StatelessWidget {
  PersonalInfoFirstWidget({super.key,required this.index});
  int index;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 20,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AppDividers.devider(height: 80),
            PersonalInfoUpBar(currentIndex: index),
            AppDividers.devider(height: 20),
            Text(
              LocaleKeys.personal_personalInfo.tr(),
              style: AppTextStyle.white17SemiBold,
            ),
            AppDividers.devider(height: 10),
            Text(
              LocaleKeys.personal_joinUsToday.tr(),
              style: AppTextStyle.white12Bold,
              textAlign: TextAlign.center,
            ),
        
            AppDividers.devider(height: 60),
            Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    hintText: LocaleKeys.personal_firstName.tr(),
                    controller:
                        context.read<PersonalInfoCubit>().firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.errors_thisFieldIsRequired.tr();
                      }
                      if (!AppRegex.isValidName(value)) {
                        return LocaleKeys.inputValidation_nameFormat.tr();
                      }
                      if (value.length < 3) {
                        return LocaleKeys.inputValidation_firstNameLength.tr();
                      }
                      return null;
                    },
                  ),
                ),
                AppDividers.devider(width: 10),
                Expanded(
                  child: AppTextFormField(
                    hintText: LocaleKeys.personal_lastName.tr(),
                    controller:
                        context.read<PersonalInfoCubit>().lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.errors_thisFieldIsRequired.tr();
                      }
                      if (!AppRegex.isValidName(value)) {
                        return LocaleKeys.inputValidation_nameFormat.tr();
                      }
                      if (value.length < 3) {
                        return LocaleKeys.inputValidation_lastNameLength.tr();
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            AppDividers.devider(height: 30),
            BirthDatePicker(
              dateController: context.read<PersonalInfoCubit>().dateOfBirth,
            ),
            AppDividers.devider(height: 30),
            PersonalInfoSelectGender(
              genderController: context.read<PersonalInfoCubit>().genderController,
            ),
            AppDividers.devider(height: 30),
            Expanded(
              child: AppTextFormField(
                suffixIcon: Container(
                  width: 20,
                  height: 30,
                  child: Center(
                    child: CountryFlag.fromCountryCode(
                      'iq',
                      width: 30,
                      height: 20,
                      shape: RoundedRectangle(2),
                    ),
                  ),
                ),
                hintText: LocaleKeys.personal_phone.tr(),
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone,
                controller: context.read<PersonalInfoCubit>().phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.errors_thisFieldIsRequired.tr();
                  }
                  if (!AppRegex.isValidPhoneNumber(value)) {
                    return LocaleKeys.inputValidation_phoneLength.tr();
                  }
                  if (value.length < 9) {
                    return LocaleKeys.inputValidation_phoneLength.tr();
                  }
                  return null;
                },
              ),
            ),
            AppButtons.normalButton(
              onPressed: () {
                if(context.read<PersonalInfoCubit>().genderController.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(LocaleKeys.inputValidation_genderRequired.tr())));
                  return;
                } 
                if(context.read<PersonalInfoCubit>().dateOfBirth.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(LocaleKeys.inputValidation_dateOfBirthRequired.tr())));
                  return;
                } 
      
                if(formKey.currentState!.validate()){
                  context.read<PersonalInfoCubit>().pageController.nextPage(
                    curve: Curves.linearToEaseOut,
                    duration: Duration(milliseconds: 500)
                  );
                }
              },
              label: LocaleKeys.main_next.tr(),
            ),
            AppDividers.devider(height: 40),
          ],
        ),
      ),
    );
  }
}
