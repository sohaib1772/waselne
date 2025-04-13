import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/widgets/entry_screens_header.dart';
import 'package:waselne/core/shared/widgets/lang_picker.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/cubit/code_verification_cubit.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/cubit/code_verification_states.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/widgets/resend_verification_code.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/widgets/verification_pinput.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class CodeVerificationScreen extends StatelessWidget {
  CodeVerificationScreen({super.key, required this.email, this.type});
  String email;
  String? type;
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      showAppBar: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          child: BlocListener<CodeVerificationCubit, CodeVerificationStates>(
            listener: (context, state) {
              if (state is CodeVerificationSuccess) {
                AppRouter.routes.pushNamed(
                  AppRouterNames.personalInfo,
                  extra: state.countries,
                );
              } else if (state is CodeVerificationError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              } else if (state is CodeVerificationCheckEmailSuccess) {
                AppRouter.routes.pushNamed(
                  AppRouterNames.changePassword,
                  queryParameters: {
                    "type": "password",
                    "email": email,
                    "code": codeController.text,
                  },
                );
              }
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  entryScreensHeader(LocaleKeys.auth_verifyCode.tr(), LocaleKeys.auth_enterCodeWeSentToYourEmail.tr()),
                  AppDividers.devider(height: 40),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        VerificationPinput(controller: codeController),
                        AppDividers.devider(height: 20),
                        ResendVerificationCode(
                          email: email,
                          isPassword: type == "password" ? true : false,
                        ),
                      
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
                                      if (type == "password") {
                                        context
                                            .read<CodeVerificationCubit>()
                                            .passwordVerification(
                                              codeController.text,
                                              email,
                                            );
                                      } else {
                                        context
                                            .read<CodeVerificationCubit>()
                                            .emailVerification(
                                              codeController.text,
                                              email,
                                            );
                                      }
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
        ),
      ),
    );
  }
}
