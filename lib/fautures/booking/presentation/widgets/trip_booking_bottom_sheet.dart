import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_cubit.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class TripBookingBottomSheet extends StatefulWidget {
  TripBookingBottomSheet({
    super.key,
    required this.maxSeats,
    required this.seatPrice,
    required this.cubit,
    required this.tripId
  });
  int maxSeats;
  double seatPrice;
  BookingCubit cubit;
  int tripId;
  @override
  State<TripBookingBottomSheet> createState() => _TripBookingBottomSheetState();
}

class _TripBookingBottomSheetState extends State<TripBookingBottomSheet> {
  int seatCount = 1;
  TextEditingController detailsController = TextEditingController();
  double price = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price = seatCount * widget.seatPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 0,
        left: 20.r,
        right: 20.r,
        bottom: 10.r,
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2.3,
      decoration: BoxDecoration(
        
       color: Theme.of(context).colorScheme.surface,
        border: Border(top: BorderSide(width: 2,color: Colors.grey)),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        )
      ),
      child: Column(
        children: [
          
          Text(
            LocaleKeys.tripInfo_seatCount.tr(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20.r,
                child: IconButton(
                   padding: EdgeInsets.all(0),
                  iconSize: 28.sp,
                  onPressed: () {
                    setState(() {
                      if (widget.maxSeats > seatCount) {
                        seatCount++;
                        price = seatCount * widget.seatPrice;
                      }
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ),
              AppDividers.devider(width: 20),
              Text(
                "$seatCount",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38.sp),
              ),
              AppDividers.devider(width: 20),
              CircleAvatar(
                radius: 20.r,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  iconSize: 28.sp,
                  onPressed: () {
                    setState(() {
                      if (seatCount > 1) {
                        seatCount--;
                        price = seatCount * widget.seatPrice;
                      }
                    });
                  },
                  icon: Icon(Icons.remove),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.tripInfo_totalPrice.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  AppFormater.moneyFormat(price.toString()),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ),
          AppDividers.devider(height: 20),
          AppTextFormField(
            controller: detailsController,
            hintText: LocaleKeys.tripInfo_tripDetails.tr(),
            validator: (value) {},
          ),
          AppDividers.devider(height: 10),
          widget.cubit.state is BookingLoadingState
              ? Center(
                  child: Center(child: CircularProgressIndicator()),
                )
              :
          AppButtons.iconWithLabel(
            backgroundColor: Colors.green,
            textColor: Colors.white,
            onPressed: () {
              
              widget.cubit.bookTrip(
                seatCount: seatCount,
                details: detailsController.text,
                tripId: widget.tripId,
              );
              setState(() {
                
              });
            },
            label: LocaleKeys.main_confirm.tr(),
            icon: Icons.check_box_rounded,
          ),
          AppDividers.devider(height: 5),
          AppButtons.iconWithLabel(
            width: 150.w,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            onPressed: () {
              
              AppRouter.routes.pop();
            },
            label: LocaleKeys.main_cancel.tr(),
            icon: Icons.cancel,
          ),
        ],
      ),
    );
  }
}
