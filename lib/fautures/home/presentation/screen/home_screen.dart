import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/shared/widgets/app_error_widget.dart';
import 'package:waselne/core/shared/trip_card/trip_card.dart';
import 'package:waselne/core/shared/widgets/trip_group_widget.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_states.dart';
import 'package:waselne/fautures/home/presentation/widgets/home_screen_search_widget.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return 
      MainScaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeScreenSearchWidget(),
              AppDividers.devider(height: 30),
              BlocListener<HomeCubit, HomeStates>(
                listener: (context, state) {
                  if (state is HomeErrorState) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  } else if (state is HomeNoMoreDataToShowState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(LocaleKeys.home_theresNoMoreData.tr()),
                      ),
                    );
                  }
                },
                child: BlocBuilder<HomeCubit, HomeStates>(
                  buildWhen:
                      (previous, current) =>
                          current is HomeLoadingState ||
                          current is HomeSuccessState ||
                          current is HomeErrorState,
                  builder: (context, state) {
                    if (state is HomeLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is HomeSuccessState) {
                      return Container(
                        child: state.trips.isEmpty
                            ? Center(
                              child: Text(LocaleKeys.home_noData.tr()),
                            )
                            : Expanded(child: TripGroupWidget(tripGroup: state.trips,scrollController: context.read<HomeCubit>().scrollController,)),
                      );
                    } else if (state is HomeErrorState) {
                      return AppErrorWidget(
                        message: state.message,
                        onTap: () {
                          context.read<HomeCubit>().getHomeData(resetPages: true);
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        
            ),
      );
  }
}
