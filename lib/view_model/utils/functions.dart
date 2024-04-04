import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:last_news/view_model/utils/images.dart';

/// Returns a vertical spacing box with [height].
SizedBox verticalSpacing(double height) => SizedBox(height: height.h);

/// Returns a horizontal spacing box with [width].
SizedBox horizontalSpacing(double width) => SizedBox(width: width.w);

ToastFuture showToast({required String msg, required BuildContext context}) {
  return showToastWidget(
    context: context,
    isIgnoring: true,
    animation: StyledToastAnimation.scale,
    reverseAnimation: StyledToastAnimation.fade,
    position: StyledToastPosition.bottom,
    animDuration: const Duration(seconds: 1),
    duration: const Duration(seconds: 3),
    curve: Curves.elasticOut,
    reverseCurve: Curves.linear,
    Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: AppColors.primary,
      ),
      child: Row(
        children: [
          Image.asset(AppImages.lastNewsLogo, width: 30.w, height: 30.h),
          horizontalSpacing(10.w),
          Text(
            msg,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    ),
  );
}
