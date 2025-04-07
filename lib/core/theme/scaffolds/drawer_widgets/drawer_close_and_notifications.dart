import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:waselne/core/theme/buttons/app_buttons.dart';

class DrawerCloseAndNotifications extends StatelessWidget {
   DrawerCloseAndNotifications({super.key,required this.controller});
  AdvancedDrawerController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppButtons.iconButton(
            onPressed: () {
              controller.hideDrawer();
            },
            icon: Icons.close,
            darker: false,
          ),
          Stack(
            children: [
              AppButtons.iconButton(
                onPressed: () {},
                icon: Icons.notifications,
                darker: false,
              ),
              Positioned(
                top: 12,
                right: 8,
                child: Container(
                  height:8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
