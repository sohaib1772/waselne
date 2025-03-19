import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_states.dart';
import 'package:waselne/fautures/home/presentation/widgets/home_screen_trip_card.dart';
import 'package:waselne/fautures/home/presentation/widgets/home_screen_search_widget.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomeScreenSearchWidget(),
          AppDividers.devider(height: 30),
          BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is HomeSuccessState) {
                return Expanded(
                  child: ListView.separated(
                    controller: context.read<HomeCubit>().scrollController,
                    itemBuilder: (context, index) {
                      return HomeScreenTripCard(model: state.trips[index],);
                    },
                    itemCount: state.trips.length,
                    separatorBuilder: (context, index) {
                      return AppDividers.devider(height: 10);
                    },
                  ),
                );
              } else if (state is HomeErrorState) {
                return Text("Error");
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
