import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/core/shared/trip_card/trip_card_driver_info.dart';
import 'package:waselne/core/shared/trip_card/trip_tow_points_widget.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/dividers/app_dividers.dart';
import 'package:waselne/core/theme/scaffolds/main_scaffold.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_cubit.dart';
import 'package:waselne/fautures/booking/presentation/cubit/booking_states.dart';
import 'package:waselne/fautures/booking/presentation/screen/booking_first_screen.dart';
import 'package:waselne/fautures/booking/presentation/screen/booking_forth_screen.dart';
import 'package:waselne/fautures/booking/presentation/screen/booking_second_screen.dart';
import 'package:waselne/fautures/booking/presentation/screen/booking_third_screen.dart';
import 'package:waselne/fautures/booking/presentation/widgets/save_booking_action_button.dart';
import 'package:waselne/fautures/booking/presentation/widgets/trip_screen_driver_info.dart';
import 'package:waselne/fautures/booking/presentation/widgets/trip_seats_and_price.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class TripInfoScreen extends StatelessWidget {
  TripInfoScreen({super.key, required this.model, this.date});
  String? date;
  var model;

  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: LocaleKeys.tripInfo_info.tr(),
      leading: AppButtons.iconButton(
        onPressed: () {
          AppRouter.routes.pop();
        },
        icon: Icons.arrow_back,
      ),
      actions: [SaveBookingActionButton(model: model)],
      body: Container(
        width: double.infinity,
        child: BlocListener<BookingCubit, BookingStates>(
          listener: (context, state) {
            if (state is BookingSuccessState) {
              pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut,);
              
            }
            if (state is BookingErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: PageView.builder(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return BookingFirstScreen(date: date??"", model: model,pageController: pageController,);
              case 1:
                return BookingSecondScreen(date: date??"", model: model,controller: pageController,);
              case 2:
                return BookingThirdScreen(model: model,pageController: pageController,);
              case 3:
              return BookingForthScreen();
              default:
            }
          },)
        ),
      ),
    );
  }
}
