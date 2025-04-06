
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/cities_response_model.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_cubit.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_states.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/widgets/personal_info_form_widget.dart';

class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key,this.token,this.cities});
  String? token;
  List<CityModel>?cities;
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
                  AppRouter.routes.goNamed(AppRouterNames.home);
                }
                else if (state is PersonalInfoError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
            
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<PersonalInfoCubit,PersonalInfoStates>(builder: (context, state) {
                    if (state is PersonalInfoGetCountriesLoading) {
                      return Center(child: CircularProgressIndicator(),);
                    } else {
                      return PersonalInfoFormWidget(cities: cities,);
                    }
                  },)
                  
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
