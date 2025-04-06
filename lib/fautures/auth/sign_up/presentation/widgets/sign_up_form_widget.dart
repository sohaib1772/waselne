import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/app_regex.dart';
import 'package:waselne/core/shared/new_password_fields.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/cubit/sign_up_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          AppRouter.routes.goNamed(
            AppRouterNames.codeVerification,
            queryParameters: {
              "email": context.read<SignUpCubit>().emailController.text,
            },
          );
        }else if (state is SignUpError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }else if(state is LoginWithGoogleSuccess){
          if(state.cities != null){
            AppRouter.routes.pushNamed(AppRouterNames.personalInfo,extra: state.cities);

          }else{
            AppRouter.routes.goNamed(AppRouterNames.home);
          }
        }else if(state is SignUpResendCode){
          AppRouter.routes.pushNamed(
            AppRouterNames.codeVerification,
            queryParameters: {
              "email": state.email,
              "sendCode": "true"
            },
          );
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                     AppDividers.devider(height: 20),

            
            AppTextFormField(
              controller: context.read<SignUpCubit>().emailController,
              hintText: LocaleKeys.auth_email.tr(),
              prefixIcon: Icons.email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return LocaleKeys.errors_thisFieldIsRequired.tr();
                }
                if(!AppRegex.isValidEmail(value)){
                  return LocaleKeys.inputValidation_emailFormat.tr();
                }
                return null;
              },
            ),
            AppDividers.devider(height: 20),
            NewPasswordFields(
              passwordConfirmController: context.read<SignUpCubit>().passwordConfirmController,
              passwordController: context.read<SignUpCubit>().passwordController,
            ),

            AppDividers.devider(height: 20),
            BlocBuilder<SignUpCubit, SignUpStates>(builder:(context, state) {
              if (state is SignUpLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return AppButtons.normalButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<SignUpCubit>().signUp();
                    }
                  },
                  label: LocaleKeys.auth_signUp.tr(),
                );
              }
            }),
            AppDividers.devider(height: 10),
            
          ],
        ),
      ),
    );
  }
}
