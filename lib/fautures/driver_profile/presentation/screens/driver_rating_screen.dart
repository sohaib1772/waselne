import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/driver_profile/data/models/driver_model.dart';
import 'package:waselne/fautures/driver_profile/presentation/widgets/driver_info.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class DriverRatingScreen extends StatelessWidget {
  DriverRatingScreen({super.key, required this.driver});
  DriverModel driver;
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      actions: [
        SizedBox.shrink()
      ],
      leading: AppButtons.iconButton(onPressed: (){
        AppRouter.routes.pop();
      }, icon: Icons.arrow_back),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppDividers.devider(height: 40),
            DriverInfo(model: driver),
            AppDividers.devider(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppDividers.horizontalLineDivider(height: .5),
            ),
            AppDividers.devider(height: 20),
            Column(
              children: [
                Text(
                  AppFormater.rateingFormatter(driver.driverAvgRate ?? ""),
                  style: AppTextStyle.white36W700,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star_rate_rounded,
                      color:
                          (index+1) < double.parse(driver.driverAvgRate ?? "0")
                              ? Colors.amber
                              : AppColors.filled,
                      size: 36.sp,
                    );
                  }),
                ),
              ],
            ),
            AppDividers.devider(height: 10),
            Text(
              "${driver.ratings?.length.toString()} ${LocaleKeys.driverInfo_rating.tr()}",
              style: AppTextStyle.white15W500,
            ),
            AppDividers.devider(height: 20),
            AppDividers.horizontalLineDivider(height: 2),
            AppDividers.devider(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.darkBlue,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundColor: AppColors.filled,
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: AppColors.filled,
                                      child: Text(
                                        driver.ratings?[index].name?[0] ?? "",
                                        style: AppTextStyle.white14SemiBold,
                                      ),
                                    ),
                                  ],
                                ),
                                AppDividers.devider(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(driver.ratings?[index].name ?? "",style: AppTextStyle.white18W600,),
                                      Text(
                                        driver.ratings?[index].comment ?? "",
                                        style: AppTextStyle.white12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        AppDividers.horizontalLineDivider(height: .5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                driver.ratings?[index].createdAt?.substring(
                                      0,
                                      10,
                                    ) ??
                                    "",
                                style: AppTextStyle.whiteText12W400,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  (int.tryParse(
                                        driver.ratings?[index].rate ?? "",
                                      ) ??
                                      0),
                                  (indexx) {
                                    return Icon(
                                      Icons.star_rate_rounded,
                                      color: Colors.amber,
                                      size: 20.sp,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        AppDividers.devider(height: 10),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return AppDividers.devider(height: 10.h);
                },
                itemCount: driver.ratings?.length ?? 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
