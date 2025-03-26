import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class AppErrorWidget extends StatelessWidget {
  AppErrorWidget({super.key, required this.onTap, required this.message});

  Function onTap;
  String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(message),
          AppButtons.iconWithLabel(
            onPressed: onTap,
            icon: Icons.refresh,
            label: LocaleKeys.main_tryAgain.tr(),
          ),
        ],
      ),
    );
  }
}
