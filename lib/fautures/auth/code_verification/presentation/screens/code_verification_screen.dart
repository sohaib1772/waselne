import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/cubit/code_verification_cubit.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/cubit/code_verification_states.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/widgets/verification_pinput.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_cubit.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class CodeVerificationScreen extends StatelessWidget {
  CodeVerificationScreen({super.key, required this.email});
  String email;
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SizedBox(
        width: double.infinity,
        child: BlocListener<CodeVerificationCubit, CodeVerificationStates>(
          listener: (context, state) {
            if (state is CodeVerificationSuccess) {
              AppRouter.routes.pushNamed(AppRouterNames.personalInfo);
            } else if (state is CodeVerificationError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  text: LocaleKeys.auth_weHaveSentCodeToYourEmail.tr(),
                  children: [
                    TextSpan(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      text: "\n $email",
                    ),
                  ],
                ),
              ),
              AppDividers.devider(height: 20),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    VerificationPinput(controller: codeController),
                    AppDividers.devider(height: 20),
                    BlocBuilder<CodeVerificationCubit, CodeVerificationStates>(
                      builder: (context, state) {
                        if (state is CodeVerificationLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return AppButtons.normalButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (email != "" &&
                                    codeController.text != "" &&
                                    codeController.text.isNotEmpty) {
                                  context
                                      .read<CodeVerificationCubit>()
                                      .emailVerification(
                                        codeController.text,
                                        email,
                                      );
                                }
                              }
                            },
                            label: LocaleKeys.main_confirm.tr(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
