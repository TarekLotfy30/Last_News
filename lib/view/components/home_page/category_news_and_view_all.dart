import 'package:flutter/material.dart';
import 'package:last_news/view_model/cubit/shared_home_cubit/shared_home_cubit.dart';
import 'package:last_news/view_model/utils/styles.dart';

class CategoryNewsAndViewAll extends StatelessWidget {
  const CategoryNewsAndViewAll({
    super.key,
    required this.sharedCubit,
  });

  final SharedHomeCubit sharedCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Category News",
            style: AppTextStyles.font17PrimaryBold,
          ),
          TextButton(
            onPressed: () {
              sharedCubit.controller.index = 2;
            },
            child: Text(
              "View All",
              style: AppTextStyles.font14PrimarySemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
