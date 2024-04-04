import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_news/view/components/home_page/categories_list_view.dart';
import 'package:last_news/view/components/home_page/category_news_list_view.dart';
import 'package:last_news/view/components/widgets/app_bar_custom/sliver_app_bar_custom.dart';
import 'package:last_news/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:last_news/view_model/utils/functions.dart';
import 'package:last_news/view_model/utils/styles.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverAppBarCustom(),
          SliverAppBar(
            elevation: 0,
            backgroundColor: AppColors.primary,
            floating: true,
            snap: false,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "Category News",
                      style: AppTextStyles.font17WhiteBold,
                    ),
                  ),
                  verticalSpacing(10.h),
                  CategoriesListView(cubit: cubit),
                ],
              ),
            ),
            collapsedHeight: 110.h,
          ),
          SliverToBoxAdapter(
            child: verticalSpacing(20),
          ),
          CategoryNewsListView(cubit: cubit, isCategoryScreen: true),
        ],
      ),
    );
  }
}
