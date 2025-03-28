import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/shared/app_formater.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class HomeFilterPriceSlider extends StatefulWidget {
   HomeFilterPriceSlider({super.key,required this.price});
  TextEditingController price;
  @override
  State<HomeFilterPriceSlider> createState() => _HomeFilterPriceSliderState();
}

class _HomeFilterPriceSliderState extends State<HomeFilterPriceSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).splashColor,
              borderRadius: BorderRadius.circular(10.r),),
            child: Column(
              children: [
                Text(LocaleKeys.home_tripPrice.tr()),
                Text(double.parse(widget.price.text)== 0 ? LocaleKeys.main_any.tr() :AppFormater.moneyFormat(widget.price.text)),
                Slider(

                  divisions: (50000 / 1000).round(),
                  label: double.parse(widget.price.text)== 0 ? LocaleKeys.main_any.tr() :AppFormater.moneyFormat(widget.price.text),
                  max: 50000,
                  min: 1000,
                  value:  double.parse(widget.price.text)== 0 ? 1000:double.parse(widget.price.text), 
                  onChanged: (value) {
                  setState(() {
                    widget.price.text = ((value / 1000).round() * 1000).toString();
                  });
                },)
              ],
            ),
          );
  }
}