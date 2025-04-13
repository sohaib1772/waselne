import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/router/app_router_names.dart';
import 'package:waselne/core/shared/trip_card/trip_tow_points_widget.dart';
import 'package:waselne/core/shared/widgets/app_delete_dialog.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/my_booking/data/models/my_booking_response_model.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_cubit.dart';
import 'package:waselne/fautures/my_booking/presentation/cubit/my_booking_states.dart';
import 'package:waselne/fautures/my_booking/presentation/widgets/my_booking_edit_select_seats.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class MyBookingEditScreen extends StatefulWidget {
  MyBookingEditScreen({super.key, required this.model, required this.date});

  MyTripBookingModel model;
  String date;
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
    seatCount = widget.model.availableSeats ?? 0;
    detailsController.text = widget.model.nots ?? "";
    price = (widget.model.availableSeats ?? 0) / (widget.model.seatPrice ?? 0);
    totalPrice = (widget.model.availableSeats ?? 0) * price;
    seatNumberController.text = widget.model.myBookingSeatsCount.toString();
    myBookingCubit = context.read<MyBookingCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      leading: AppButtons.iconButton(
        icon: Icons.arrow_back_ios_new,
        onPressed: () {
          AppRouter.routes.pop();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppDividers.devider(height: 80),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  AppFormater.dateFormat(
                        widget.date,
                        context.locale.languageCode,
                      ) ??
                      "",
                  style: AppTextStyle.whiteText20Bold,
                ),
              ),
              AppDividers.devider(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TripTowPointsWidget(
                  pointOne: widget.model.from?[context.locale.languageCode],
                  pointTwo: widget.model.to?[context.locale.languageCode],
                  startTime: widget.model.tripStart ?? "",
                  endTime: "",
                ),
              ),
              AppDividers.horizontalLineDivider(height: 2),
              AppDividers.devider(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppTextFormField(
                  initValue: detailsController.text,
                  controller: detailsController,
                  hintText: LocaleKeys.myBookingInfo_bookingDetails.tr(),
                  validator: (value) {},
                ),
              ),
              AppDividers.devider(height: 10),
              AppDividers.horizontalLineDivider(height: 2),
              AppDividers.devider(height: 10),
              MyBookingEditSelectSeats(
                availableSeats: widget.model.availableSeats ?? 0,
                seatPrice: widget.model.seatPrice ?? 0,
                seatsCountController: seatNumberController,
              ),
              AppDividers.devider(height: 10),
              AppDividers.horizontalLineDivider(height: 2),
              AppDividers.devider(height: 10),
              BlocListener<MyBookingCubit, MyBookingStates>(
                listener: (context, state) {
                  if (state is MyBookingError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.message ??
                              LocaleKeys.dioErrors_unknownError.tr(),
                        ),
                      ),
                    );
                  }
                  if (state is MyBookingDeleteSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          LocaleKeys.main_deleteSuccess.tr(),
                        ),
                      ),
                    );
                  }
                  if (state is MyBookingSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          LocaleKeys.main_updateSuccess.tr(),
                        ),
                      ),

                    );
                    widget.model.myBookingSeatsCount = int.parse(seatNumberController.text);
                    widget.model.nots = detailsController.text;
                
                    
                  }

                  AppRouter.routes.pushNamed(AppRouterNames.main,extra: AppRouterNames.myBooking);
                },
                child: BlocBuilder<MyBookingCubit, MyBookingStates>(
                  builder: (context, state) {
                    if (state is MyBookingLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80.w),
                      child: Column(
                        children: [
                          AppButtons.normalButton(
                            onPressed: () {
                              context.read<MyBookingCubit>().editMyBooking(
                                id: widget.model.bookingId ?? 0,
                                seatsNumber: int.parse(
                                  seatNumberController.text,
                                ),
                                tripId: widget.model.id ?? 0,
                                details: detailsController.text,
                              );
                            },
                            label: LocaleKeys.main_confirm.tr(),
                          ),
                          AppDividers.devider(height: 20),
                          AppButtons.normalButton(
                            textColor: AppColors.red,
                            backgroundColor: AppColors.red.withAlpha(40),
                            borderColor: AppColors.border,
                            onPressed: () {
                              context.read<MyBookingCubit>().deleteMyBooking(
                                widget.model.bookingId ?? 0,
                                widget.model.id ?? 0,
                              );
                            },
                            label: LocaleKeys.myBookingInfo_cancelBooking.tr(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
