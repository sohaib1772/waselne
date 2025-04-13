import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/shared/widgets/new_password_fields.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/fautures/auth/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:waselne/fautures/auth/change_password/presentation/cubit/change_password_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class ChangePasswordNewPassowrd extends StatelessWidget {
  ChangePasswordNewPassowrd({super.key,required this.email,this.code});
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? code;
  String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          
          AppDividers.devider(height: 20),
          NewPasswordFields(passwordController: passwordController, passwordConfirmController: passwordConfirmController),
          AppDividers.devider(height: 20),
          BlocBuilder<ChangePasswordCubit, ChangePasswordStates>(
            builder: (context, state) {
             if(state is ChangePasswordLoading){
               return Center(child: CircularProgressIndicator());
             }
              return AppButtons.normalButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<ChangePasswordCubit>().changePassword(email,passwordController.text,passwordConfirmController.text,code ?? "");
                  }
                },
                label: LocaleKeys.main_submit.tr(),
              );
            },
          ),
        ],
      ),
    );
  }
}
