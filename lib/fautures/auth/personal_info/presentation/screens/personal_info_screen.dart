import 'package:auth_buttons/auth_buttons.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_cubit.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_states.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/widgets/personal_info_form_widget.dart';
import 'package:waselne/fautures/auth/sign_up/presentation/widgets/sign_up_form_widget.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key,this.token});
  String? token;
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocListener<PersonalInfoCubit, PersonalInfoStates>(
              listener: (context, state) {
                if (state is PersonalInfoSuccess) {
                  AppRouter.routes.pushReplacementNamed(AppRouterNames.main);
                }
                else if (state is PersonalInfoError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
            
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PersonalInfoFormWidget(),
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
