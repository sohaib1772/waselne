import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/shared/app_regex.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/fautures/auth/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:waselne/fautures/auth/change_password/presentation/cubit/change_password_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class ChangePasswordCheckEmail extends StatelessWidget {
  ChangePasswordCheckEmail({super.key,required this.emailController});
  TextEditingController emailController ;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: AppTextFormField(
            controller: emailController,
            hintText: LocaleKeys.auth_email.tr(),
            prefixIcon: Icons.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.errors_thisFieldIsRequired.tr();
              }
              if (!AppRegex.isValidEmail(value)) {
                return LocaleKeys.inputValidation_emailFormat.tr();
              }
              return null;
            },
          ),
        ),
        AppDividers.devider(height: 20),

        BlocBuilder<ChangePasswordCubit, ChangePasswordStates>(
          builder: (context, state) {
           if(state is ChangePasswordLoading){
             return Center(child: CircularProgressIndicator());
           }
            return AppButtons.normalButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<ChangePasswordCubit>().checkEmail(emailController.text);
                }
              },
              label: LocaleKeys.main_submit.tr(),
            );
          },
        ),
      ],
    );
  }
}
