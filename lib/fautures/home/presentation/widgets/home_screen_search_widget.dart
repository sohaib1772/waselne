import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/router/app_router.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/core/theme/text_fields/app_text_form_field.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class HomeScreenSearchWidget extends StatelessWidget {
   HomeScreenSearchWidget({super.key});
  TextEditingController searchController = TextEditingController();
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
                      showBottomSheet(
                        context: context, builder: (context) {
                        return SizedBox(
                          height: 200.h,
                          width: double.infinity,
                          child: Column(
                            children: [
                              AppButtons.iconWithLabel(onPressed: () {
                                AppRouter.routes.pop();
                              }, icon: Icons.search, label: LocaleKeys.main_submit.tr()),
                            ],
                          ),
                        );
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