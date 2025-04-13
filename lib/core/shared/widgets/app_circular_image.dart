import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';
import 'package:waselne/core/theme/themes/app_text_style.dart';

class AppCircularImage extends StatelessWidget {
   AppCircularImage({super.key,this.imageSize = 30,required this.driverPhoto,required this.name});
  String name;
  double imageSize;
  String driverPhoto;
  @override
  Widget build(BuildContext context) {
    return Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.teal,
              radius: (imageSize + 2).r,
            ),
            CircleAvatar(
              backgroundColor: driverPhoto.isEmpty? AppColors.filled1Opacity: Colors.transparent,
              radius: imageSize.r,
              backgroundImage: NetworkImage(
                driverPhoto.replaceAll("//", "https://"),
              ),
              child:
                  driverPhoto.isEmpty
                      ? Text(name[0], style: AppTextStyle.white16W900)
                      : SizedBox.shrink(),
            ),
          ],
        );
  }
}