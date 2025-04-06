import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_states.dart';
import 'package:waselne/fautures/home/presentation/widgets/home_filter_bottom_sheet.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class HomeScreenSearchWidget extends StatefulWidget {
   HomeScreenSearchWidget({super.key});

  @override
  State<HomeScreenSearchWidget> createState() => _HomeScreenSearchWidgetState();
}

class _HomeScreenSearchWidgetState extends State<HomeScreenSearchWidget> {
  TextEditingController searchController = TextEditingController();

  late HomeCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<HomeCubit>();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             AppButtons.iconButton(onPressed: (){
                   if(cubit.state is HomeLoadingState) return;
                      showBottomSheet(
                        context: context, builder: (context) {
                        return HomeFilterBottomSheet(cubit: cubit,);
                      });
                 }, icon: Icons.swap_vert,darker: false),
              
                 AppButtons.iconButton(onPressed: (){
                   if(cubit.state is HomeLoadingState) return;
                      showBottomSheet(
                        context: context, builder: (context) {
                        return HomeFilterBottomSheet(cubit: cubit,);
                      });
                 }, icon: Icons.filter_alt_rounded,darker: false),
            ],
          );
  }
}