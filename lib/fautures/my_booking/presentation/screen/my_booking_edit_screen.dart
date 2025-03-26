import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/app_delete_dialog.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_cubit.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class MyBookingEditScreen extends StatefulWidget {
  MyBookingEditScreen({super.key, required this.model});

  MyBookingModel model;

  @override
  State<MyBookingEditScreen> createState() => _MyBookingEditScreenState();
}

class _MyBookingEditScreenState extends State<MyBookingEditScreen> {
  TextEditingController seatNumberController = TextEditingController();

  TextEditingController detailsController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double price = 0;
  double totalPrice = 0;
  int seatCount = 0;

  late MyBookingCubit myBookingCubit;
  @override
  void initState() {
    super.initState();
    seatCount = widget.model.seatsNumber ?? 0;
    detailsController.text = widget.model.details ?? "";
    price = (widget.model.totalPrice ?? 0) / (widget.model.seatsNumber ?? 0);
    totalPrice = (widget.model.seatsNumber ?? 0) * price;
    myBookingCubit = context.read<MyBookingCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocListener<MyBookingCubit, MyBookingStates>(
          listener: (context, state) {
            if (state is MyBookingSuccess || state is MyBookingDeleteSuccess) {
              AppRouter.routes.pop();
            }
            if (state is MyBookingError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message ?? "")));
            }
          },
          child: Container(
            width: double.infinity,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    LocaleKeys.myBookingInfo_editBooking.tr(),
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppDividers.devider(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(LocaleKeys.myBookingInfo_bookingPrice.tr()),
                      Text(
                        AppFormater.moneyFormat(totalPrice.toString()) ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 24.sp,
                        ),
                      ),
                    ],
                  ),
                  AppDividers.devider(height: 10.h),
                  Text(
                    LocaleKeys.tripInfo_seatCount.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
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
                              seatCount++;
                              totalPrice = seatCount * price;
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                      ),
                      AppDividers.devider(width: 20),
                      Text(
                        "$seatCount",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 38.sp,
                        ),
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
                                totalPrice = seatCount * price;
                              }
                            });
                          },
                          icon: Icon(Icons.remove),
                        ),
                      ),
                    ],
                  ),
                  AppDividers.devider(height: 10.h),
                  AppTextFormField(
                    controller: detailsController,
                    hintText: LocaleKeys.myBookingInfo_bookingDetails.tr(),
                    validator: (value) {},
                  ),
                  AppDividers.devider(height: 10.h),
                  BlocBuilder<MyBookingCubit, MyBookingStates>(
                    builder: (context, state) {
                      if (state is MyBookingLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Column(
                        children: [
                          AppButtons.normalButton(
                            onPressed: () {
                              context.read<MyBookingCubit>().editMyBooking(
                                widget.model.id ?? 0,
                                seatCount ?? 0,
                                widget.model.tripId ?? 0,
                                detailsController.text,
                              );
                            },
                            label: LocaleKeys.main_confirm.tr(),
                          ),
                          AppDividers.devider(height: 10.h),
                          AppButtons.normalButton(
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (nn) {
                                  return AppDeleteDialog(
                                    onSubmit: () {
                                      myBookingCubit.deleteMyBooking(
                                            widget.model.id ?? 0,
                                            widget.model.tripId ?? 0,
                                          );
                                      AppRouter.routes.pop();
                                    },
                                  );
                                },
                              );
                            },
                            label: LocaleKeys.myBookingInfo_cancelBooking.tr(),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
