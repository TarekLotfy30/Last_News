import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_news/view_model/utils/colors.dart';


class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? buttonBackgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? borderRadius;
  final Widget? child;

  const AppButton({
    super.key,
    required this.onPressed,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonBackgroundColor,
    this.buttonWidth,
    this.buttonHeight,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding?.w ?? 14.w,
          vertical: verticalPadding?.h ?? 15.h,
        ),
        backgroundColor: buttonBackgroundColor ?? AppColors.primary,
        elevation: 0,
        minimumSize:
            Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 52.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        ),
      ),
      child:child,
    );
  }
}

