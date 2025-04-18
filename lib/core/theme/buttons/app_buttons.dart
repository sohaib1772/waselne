import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waselne/core/theme/themes/app_colors.dart';

class AppButtons {
  static Widget iconWithLabel({
    String? label,
    IconData? icon,
    required Function onPressed,
    double width = double.infinity,
    Color? backgroundColor,
    Color? textColor,
    double? borderWidth,
  }) {
    return SizedBox(
      width: width.w,
      child: FilledButton.icon(
        iconAlignment: IconAlignment.start,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),
                side: BorderSide(color: AppColors.border, width: borderWidth ?? 0)),
          ),
          backgroundColor:
              backgroundColor != null
                  ? WidgetStatePropertyAll(backgroundColor)
                  : WidgetStatePropertyAll(AppColors.teal),
        ),
        onPressed: () => onPressed(),
        label: Text(
          "$label",
          style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(icon, color: textColor ?? Colors.black),
      ),
    );
  }

  static Widget normalButton({
    String? label,
    required Function onPressed,
    double? width,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
  }) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 48,
      child: FilledButton(
        style: ButtonStyle(
          
          backgroundColor: WidgetStatePropertyAll(backgroundColor ?? AppColors.teal),
          textStyle: WidgetStatePropertyAll(TextStyle(color: textColor?? Colors.black)),
          shape: WidgetStatePropertyAll(
            
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),side: BorderSide(color: borderColor ?? Colors.transparent,width: 1)),
          ),
        ),
        onPressed: () => onPressed(),
        child: Text("$label",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: textColor?? Colors.black),),
      ),
    );

  }

  static Widget iconButton({required Function onPressed, required IconData icon,bool darker = true}) {
    return InkWell(
      borderRadius: BorderRadius.circular(9.r),
      onTap: () => onPressed(),
      radius: 9.r,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: darker? AppColors.darkerBlue : AppColors.darkBlue,
          borderRadius: BorderRadius.circular(9.r),
         
        ),
        child:Icon(icon,color: Colors.white,),
      ),
    );
  }

  static Widget widgetButton({ required Widget child,required Function onTap,double radius = 10,WidgetButtonBorderSide borderSide = WidgetButtonBorderSide.all}) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        
          borderRadius: _setBorderRadius(borderSide,radius: radius),
        ))
      ),
      onPressed:()=> onTap(), child: child);
  }
 static BorderRadiusGeometry _setBorderRadius(WidgetButtonBorderSide side,{double radius = 10}) {
  switch (side) {
    case WidgetButtonBorderSide.all:
      return BorderRadius.circular(10.r);
    case WidgetButtonBorderSide.bottom:
      return BorderRadius.only(bottomLeft: Radius.circular(radius.r),bottomRight: Radius.circular(radius.r));
    case WidgetButtonBorderSide.top:
      return BorderRadius.only(topLeft: Radius.circular(radius.r),topRight: Radius.circular(radius.r));
    case WidgetButtonBorderSide.left:
      return BorderRadius.only(topLeft: Radius.circular(radius.r),bottomLeft: Radius.circular(radius.r));
    case WidgetButtonBorderSide.right:
      return BorderRadius.only(topRight: Radius.circular(radius.r),bottomRight: Radius.circular(radius.r));

  }
}

}

enum WidgetButtonBorderSide  {
  all,
  bottom,
  top,
  left,
  right
}

