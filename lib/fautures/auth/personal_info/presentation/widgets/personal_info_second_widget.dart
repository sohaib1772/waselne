import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/shared/app_regex.dart';
import 'package:waselne/core/shared/city_picker.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/cities_response_model.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_cubit.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_states.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/widgets/personal_info_up_bar.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class PersonalInfoSecondWidget extends StatelessWidget {
  PersonalInfoSecondWidget({super.key, this.cities});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<CityModel>? cities;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 20,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AppDividers.devider(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppButtons.iconButton(onPressed: (){
                  context.read<PersonalInfoCubit>().pageController.previousPage(duration: Duration(milliseconds: 800), curve: Curves.linearToEaseOut);
                }, icon:Icons.keyboard_arrow_left),
              ],
            ),
            AppDividers.devider(height: 20),
            PersonalInfoUpBar(currentIndex: 2),
            AppDividers.devider(height: 20),
            Text(
              LocaleKeys.personal_location.tr(),
              style: AppTextStyle.white26Bold,
            ),
            AppDividers.devider(height: 10),
            Text(
              LocaleKeys.personal_wehreAreYoulocated.tr(),
              style: AppTextStyle.white17SemiBold,
              textAlign: TextAlign.center,
            ),
            AppDividers.devider(height: 80),
            AppTextFormField(
              hintText: LocaleKeys.personal_address.tr(),
              prefixIcon: Icons.location_on,
              controller: context.read<PersonalInfoCubit>().addressController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.errors_thisFieldIsRequired.tr();
                }

                if (value.length < 10) {
                  return LocaleKeys.inputValidation_addressLength.tr();
                }
                return null;
              },
            ),
            AppDividers.devider(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.personal_city.tr(),
                  style: AppTextStyle.white14W500,
                ),
                AppDividers.devider(height: 5),
                CityPicker(
                  controller: context.read<PersonalInfoCubit>().cityController,
                  cities: cities,
                  labelText: LocaleKeys.personal_city.tr(),
                ),
              ],
            ),
            AppDividers.devider(height: 30),
            Text(
              LocaleKeys.personal_waselniWillUseYourLocation.tr(),
              style: AppTextStyle.white14SemiBold,
            ),
            AppDividers.devider(height: 20),
            Text(
              LocaleKeys.personal_byEnteringYourLocation.tr(),
              style: AppTextStyle.white14SemiBold,
            ),
            AppDividers.devider(height: 30),
            BlocBuilder<PersonalInfoCubit,PersonalInfoStates>(
              buildWhen: (previous, current) => current is PersonalInfoLoading || current is PersonalInfoError,
              builder: (context, state) {

                if(state is PersonalInfoLoading) return Center(child: CircularProgressIndicator(color: AppColors.teal,),);
                return AppButtons.normalButton(
                  onPressed: () {
                    if (context
                        .read<PersonalInfoCubit>()
                        .cityController
                        .text
                        .isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            LocaleKeys.inputValidation_cityRequired.tr(),
                          ),
                        ),
                      );
                      return;
                    }

                    if (formKey.currentState!.validate()) {
                      context.read<PersonalInfoCubit>().createProfile();
                    }
                  },
                  label: LocaleKeys.main_done.tr(),
                );
              },
            ),
            AppDividers.devider(height: 40),
          ],
        ),
      ),
    );
  }
}
