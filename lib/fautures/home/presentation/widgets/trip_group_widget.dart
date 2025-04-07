import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/helpers/app_local_storage/app_local_storage.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/shared/trip_card/trip_card.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/home/data/models/home_response_model.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';

class TripGroupWidget extends StatelessWidget {
  TripGroupWidget({super.key, this.tripGroup});
  List<HomeTripsDateGroupModel>? tripGroup;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: context.read<HomeCubit>().scrollController,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppFormater.dateFormat(tripGroup?[index].date??"",context.locale.languageCode )?? "", style: AppTextStyle.white16W900),
            AppDividers.devider(height: 10.h),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),

              shrinkWrap: true,
              itemBuilder: (context, ind) {
                return TripCard(model: tripGroup?[index].trips?[ind],date: tripGroup?[index].date ?? "",);
              },
              separatorBuilder: (context, ind) {
                return AppDividers.devider(height: 10.h);
              },
              itemCount: tripGroup?[index].trips?.length ?? 0,
            ),
            AppDividers.horizontalLineDivider(),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return AppDividers.devider(height: 10.h);
      },
      itemCount: tripGroup?.length ?? 0,
    );
  }
}
