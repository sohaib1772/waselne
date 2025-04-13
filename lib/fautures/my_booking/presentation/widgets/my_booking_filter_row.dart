import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_cubit.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class MyBookingFilterRow extends StatelessWidget {
  const MyBookingFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: AppColors.border, width: 1.5.w)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppDividers.devider(width: 20.w),
                      buildRowFilterButton(
                        onTap: () {
                          context.read<MyBookingCubit>().changeBookingStatus(
                            BookingStatus.all
                          );
                        },
                        icon: Icons.article_outlined,
                        lable: LocaleKeys.main_any.tr(),
                        isSelected:
                            context.read<MyBookingCubit>().bookingStatus ==
                            BookingStatus.all
                      ),
                  
                      AppDividers.devider(width: 20.w),
                  
                      buildRowFilterButton(
                        onTap: () {
                          context.read<MyBookingCubit>().changeBookingStatus(
                            BookingStatus.pending
                          );
                        },
                        icon: Icons.pending_actions,
                        lable: LocaleKeys.myBookingInfo_pending.tr(),
                        isSelected:
                            context.read<MyBookingCubit>().bookingStatus ==
                            BookingStatus.pending
                      ),
                  
                      AppDividers.devider(width: 20.w),
                  
                      buildRowFilterButton(
                        onTap: () {
                          context.read<MyBookingCubit>().changeBookingStatus(
                           BookingStatus.accepted,
                          );
                        },
                        icon: Icons.check_circle,
                        lable: LocaleKeys.myBookingInfo_accepted.tr(),
                        isSelected:
                            context.read<MyBookingCubit>().bookingStatus ==
                            BookingStatus.accepted,
                      ),
                      AppDividers.devider(width: 20.w),
                      buildRowFilterButton(
                        onTap: () {
                          context.read<MyBookingCubit>().changeBookingStatus(
                           BookingStatus.rejected
                          );
                        },
                        icon: Icons.cancel_sharp,
                        lable: LocaleKeys.myBookingInfo_rejected.tr(),
                        isSelected:
                            context.read<MyBookingCubit>().bookingStatus ==
                            BookingStatus.rejected,
                      ),
                      AppDividers.devider(width: 20),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
       // AppDividers.horizontalLineDivider(),
      ],
    );
  }
}

Widget buildRowFilterButton({
  required Function onTap,
  required IconData icon,
  required String lable,
  bool isSelected = false,
}) {
  {
    return InkWell(
      borderRadius: BorderRadius.circular(24.r),
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      radius: 24.r,

      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: isSelected ? Border(bottom: BorderSide(color: AppColors.teal, width: 2.w)):null,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 44.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: AppColors.border),
            color: isSelected ? AppColors.filled : Colors.transparent,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 20.sp),
              AppDividers.devider(width: 5.w),
              Text(lable, style: AppTextStyle.white16W500),
            ],
          ),
        ),
      ),
    );
  }
}
