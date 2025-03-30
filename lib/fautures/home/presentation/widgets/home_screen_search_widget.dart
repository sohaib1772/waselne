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
    // TODO: implement initState
    super.initState();
    cubit = context.read<HomeCubit>();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 250.w,
                child: AppTextFormField(
                  suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search_rounded),
                ),
                  controller:searchController , hintText: LocaleKeys.main_search.tr(), validator: (value) {
                  return null;
                },),
                ),
            
              Row(
                children: [
                 
                  IconButton(
                    onPressed: () {
                      if(cubit.state is HomeLoadingState) return;
                      showBottomSheet(
                        context: context, builder: (context) {
                        return HomeFilterBottomSheet(cubit: cubit,);
                      });
                    },
                    icon: Icon(Icons.filter_list),
                  ),
                ],
              ),
            ],
          );
  }
}