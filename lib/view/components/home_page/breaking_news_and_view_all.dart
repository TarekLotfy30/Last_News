import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_news/view_model/cubit/shared_home_cubit/shared_home_cubit.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:last_news/view_model/utils/styles.dart';

class BreakingNewsAndViewAll extends StatelessWidget {
  const BreakingNewsAndViewAll({
    super.key,
    required this.sharedCubit,
  });

  final SharedHomeCubit sharedCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      margin: EdgeInsets.only(bottom: 180.h),
      padding: const EdgeInsets.symmetric(horizontal: 22),
      color: AppColors.primary,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Breaking News 🔥",
                style: AppTextStyles.font20WhiteSemiBold,
              ),
              TextButton(
                onPressed: () {
                  sharedCubit.controller.index = 1;
                },
                child: Text(
                  "View All",
                  style: AppTextStyles.font15WhiteRegular,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
