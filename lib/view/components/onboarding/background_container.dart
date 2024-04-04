import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_news/view_model/utils/colors.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.h, left: 19.w, right: 19.w),
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(14).r,
          topRight: const Radius.circular(14).r,
        ),
      ),
    );
  }
}