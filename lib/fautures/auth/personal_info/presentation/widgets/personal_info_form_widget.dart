import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_regex.dart';
import 'package:waselne/core/shared/city_picker.dart';
import 'package:waselne/core/shared/date_picker.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/cities_response_model.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/personal_info_model.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_cubit.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class PersonalInfoFormWidget extends StatefulWidget {
   PersonalInfoFormWidget({super.key,this.cities});
  List<CityModel>? cities;
  @override
  State<PersonalInfoFormWidget> createState() => _PersonailInfoWidgetState();
}

class _PersonailInfoWidgetState extends State<PersonalInfoFormWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool showConfirmPassword = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppDividers.devider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextFormField(
                width: 150.w,
                controller: firstNameController,
                hintText: LocaleKeys.personal_firstName.tr(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.errors_thisFieldIsRequired.tr();
                  }
                  if(!AppRegex.isValidName(value)){
                    return LocaleKeys.inputValidation_nameFormat.tr();
                  }
                  if(value.length < 3){
                    return LocaleKeys.inputValidation_firstNameLength.tr();
                  }
                  return null;
                },
              ),
              AppDividers.devider(width: 5),
              AppTextFormField(
                width: 150.w,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.errors_thisFieldIsRequired.tr();
                  }
                   if(!AppRegex.isValidName(value)){
                    return LocaleKeys.inputValidation_nameFormat.tr();
                  }
                  if(value.length < 3){
                    return LocaleKeys.inputValidation_lastNameLength.tr();
                  }
                  return null;
                },
                controller: lastNameController,
                hintText: LocaleKeys.personal_lastName.tr(),
              ),
            ],
          ),
          AppDividers.devider(height: 20),
          BirthDatePicker(dateController: birthDateController),
          AppDividers.devider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButtons.iconWithLabel(
                backgroundColor: gender == "male" ? Colors.green : null,
                width: 100.w,
                onPressed: () {
                  setState(() {
                    gender = "male";
                  });
                },
                label: LocaleKeys.personal_Male.tr(),
                icon: Icons.male_outlined,
              ),
              AppDividers.devider(width: 20),
              AppButtons.iconWithLabel(
                backgroundColor: gender == "female" ? Colors.green : null,
                width: 100.w,
                onPressed: () {
                  setState(() {
                    gender = "female";
                  });
                },
                label: LocaleKeys.personal_Female.tr(),
                icon: Icons.female_outlined,
              ),
            ],
          ),
          AppDividers.devider(height: 20),
          AppTextFormField(
            controller: phoneController,
            hintText: "+963xxxxxxxxxx",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.errors_thisFieldIsRequired.tr();
              }
              if(!AppRegex.isValidPhoneNumber(value)){
                return LocaleKeys.inputValidation_phoneLength.tr();
              }
              return null;
            },
          ),
          AppDividers.devider(height: 20),
          AppTextFormField(
            controller: addressController,
            hintText: LocaleKeys.personal_address.tr(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.errors_thisFieldIsRequired.tr();
              }
              if(value.length < 10){
                return LocaleKeys.inputValidation_addressLength.tr();
              }
              return null;
            },
          ),
          AppDividers.devider(height: 20),
          CityPicker(controller: cityController, cities: widget.cities,labelText: LocaleKeys.others_city.tr(),),
          AppDividers.devider(height: 20),
          BlocBuilder<PersonalInfoCubit, PersonalInfoStates>(
            builder: (context, state) {
              if (state is PersonalInfoLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return AppButtons.iconWithLabel(
                  onPressed: () {
                    if(gender == null){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(LocaleKeys.inputValidation_genderRequired.tr()),
                        ),
                      );
                      return;
                    }
                    if (formKey.currentState!.validate()) {
                      context.read<PersonalInfoCubit>().createProfile(
                        PersonalInfoModel(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          phone: phoneController.text,
                          address: addressController.text,
                          cityId: int.tryParse(cityController.text) ?? 0,
                          birthday: birthDateController.text,
                          gender: gender,
                        ),
                      );
                    }
                  },
                  label: LocaleKeys.main_confirm.tr(),
                  icon: Icons.login,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
