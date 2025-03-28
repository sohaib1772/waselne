import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/shared/app_error_widget.dart';
import 'package:waselne/core/shared/trip_card.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
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
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(LocaleKeys.home_reasultsCount.tr()),
                            Text("${state.reasultCounts}"),
                          ],
                        ),
                        AppDividers.devider(height: 10),
                        Expanded(
                          child:
                              state.trips.isEmpty
                                  ? Center(
                                    child: Text(LocaleKeys.home_noData.tr()),
                                  )
                                  : ListView.separated(
                                    controller:
                                        context
                                            .read<HomeCubit>()
                                            .scrollController,
                                    itemBuilder: (context, index) {
                                      if (index == state.trips.length) {
                                        //Todo: add loading indicator
                                      } else {
                                        return TripCard(
                                          model: state.trips[index],
                                        );
                                      }
                                    },
                                    itemCount: state.trips.length + 1,
                                    separatorBuilder: (context, index) {
                                      return AppDividers.devider(height: 10);
                                    },
                                  ),
                        ),
                      ],
                    ),
                  );
                } else if (state is HomeErrorState) {
                  return AppErrorWidget(
                    message: state.message,
                    onTap: () {
                      context.read<HomeCubit>().getHomeData();
                    },
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
