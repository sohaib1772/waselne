
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/fautures/auth/personal_info/data/models/cities_response_model.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_cubit.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/cubit/personal_info_states.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/widgets/personal_info_first_widget.dart';
import 'package:waselne/fautures/auth/personal_info/presentation/widgets/personal_info_second_widget.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key,this.token,this.cities});
  String? token;
  List<CityModel>?cities;
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      showAppBar: false,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: BlocListener<PersonalInfoCubit, PersonalInfoStates>(
          listener: (context, state) {
            if (state is PersonalInfoSuccess) {
              AppRouter.routes.goNamed(AppRouterNames.home);
            }
            else if (state is PersonalInfoError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        
          child: PageView.builder(
                    
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      print(value);
                    },
                    itemCount: 2,
                    pageSnapping: true,
                    allowImplicitScrolling: false,
                  
                    physics: const NeverScrollableScrollPhysics(),
                    
                    controller: context.read<PersonalInfoCubit>().pageController,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Builder(builder: (context) {
                          switch(index){
                            case 0:
                            print(index);
                          return  PersonalInfoFirstWidget(index: index+1,);
                            case 1:
                            print(index);
                          return  PersonalInfoSecondWidget(cities: cities,);
                            default: return Container();
                          }
                        },));
                    },
                  )
        ),
      ),
    );
  }
}
