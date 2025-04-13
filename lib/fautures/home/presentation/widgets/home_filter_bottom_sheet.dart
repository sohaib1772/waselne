import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/shared/widgets/city_picker.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_cubit.dart';
import 'package:waselne/fautures/home/presentation/cubit/home_states.dart';
import 'package:waselne/fautures/home/presentation/widgets/home_filter_available_seats_slider.dart';
import 'package:waselne/fautures/home/presentation/widgets/home_filter_cities_pickers.dart';
import 'package:waselne/fautures/home/presentation/widgets/home_filter_date_pickers.dart';
import 'package:waselne/fautures/home/presentation/widgets/home_filter_price_slider.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class HomeFilterBottomSheet extends StatefulWidget {
  HomeFilterBottomSheet({super.key, required this.cubit});
  HomeCubit cubit;
  @override
  State<HomeFilterBottomSheet> createState() => _HomeFilterBottomSheetState();
}

class _HomeFilterBottomSheetState extends State<HomeFilterBottomSheet> {
  TextEditingController cityStartController = TextEditingController();
  TextEditingController cityEndController = TextEditingController();
  TextEditingController priceController = TextEditingController(text: "0");
  TextEditingController availableSeatsController = TextEditingController(
    text: "1",
  );
  DateTime? date;
  TimeOfDay? time;
  TextEditingController tripStartDateController = TextEditingController();
  TextEditingController tripStartTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HomeFilterCitiesPickers(
              cities: widget.cubit.cities,
              cityStartController: cityStartController,
              cityEndController: cityEndController,
            ),
            AppDividers.devider(height: 20),
            HomeFilterPriceSlider(price: priceController),
            AppDividers.devider(height: 10),
            HomeFilterDatePickers(
              tripStartDateController: tripStartDateController,
              tripStartTimeController: tripStartTimeController,
            ),
            AppDividers.devider(height: 10),
            HomeFilterAvailableSeatsSlider(
              availableSeats: availableSeatsController,
            ),
            AppDividers.devider(height: 10),
            widget.cubit.state is HomeFilterLoadingState
                ? Center(child: CircularProgressIndicator())
                : AppButtons.iconWithLabel(
                  onPressed: () async {
                    if (cityStartController.text == cityEndController.text &&
                        cityStartController.text.isNotEmpty &&
                        cityEndController.text.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            LocaleKeys.home_citiesShouldBeDifferent.tr(),
                          ),
                        ),
                      );
                      return;
                    }
                    setState(() {});
                    widget.cubit.params = {
                      "from": cityStartController.text,
                      "to": cityEndController.text,
                      "seatPrice": priceController.text == "0" ? null : priceController.text,
                      "startDate": tripStartDateController.text,
                      "startTime": tripStartTimeController.text,
                      "availableSeats":
                          int.tryParse(availableSeatsController.text) ?? 0,
                    };
                    await widget.cubit.getHomeData(resetPages: true);
                    AppRouter.routes.pop();
                  },
                  label: LocaleKeys.home_search.tr(),
                  icon: Icons.search,
                ),
          ],
        ),
      ),
    );
  }
}
