import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_news/view/components/widgets/category_card.dart';
import 'package:last_news/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:last_news/view_model/utils/functions.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w),
      height: 45.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryCard(
          categoryCardObj: cubit.categoryList[index],
          onTap: () {
            if (cubit.currentIndex != index) {
              cubit.changeIndex(index);
              cubit.getSelectedCategoryNewsData();
            }
          },
        ),
        separatorBuilder: (context, index) => horizontalSpacing(10.w),
        itemCount: cubit.categoryList.length,
      ),
    );
  }
}
