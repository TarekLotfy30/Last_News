import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_news/model/news_model.dart';
import 'package:last_news/view/components/home_page/breaking_news_and_view_all.dart';
import 'package:last_news/view/components/home_page/categories_list_view.dart';
import 'package:last_news/view/components/home_page/category_news_and_view_all.dart';
import 'package:last_news/view/components/home_page/category_news_list_view.dart';
import 'package:last_news/view/components/home_page/discover_news_and_search_bar.dart';
import 'package:last_news/view/components/widgets/app_bar_custom/sliver_app_bar_custom.dart';
import 'package:last_news/view/components/widgets/news_card/breaking_news_widget.dart';
import 'package:last_news/view/screens/webview/web_view_screen.dart';
import 'package:last_news/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:last_news/view_model/cubit/shared_home_cubit/shared_home_cubit.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:last_news/view_model/utils/functions.dart';
import 'package:last_news/view_model/utils/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    final sharedCubit = SharedHomeCubit.get(context);
    return Scaffold(
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverAppBarCustom(),
          SliverAppBar(
            elevation: 0,
            backgroundColor: AppColors.primary,
            floating: true,
            snap: true,
            stretch: true,
            expandedHeight: 115.h,
            collapsedHeight: 115.h,
            flexibleSpace: DiscoverNewsAndSearchBar(cubit: cubit),
          ),
          SliverToBoxAdapter(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                BreakingNewsAndViewAll(sharedCubit: sharedCubit),
                PositionedDirectional(
                  top: 50.h,
                  start: 0,
                  end: 0,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 325.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) => BreakingNewsWidget(
                            onTap: () => Navigation.push(
                              context,
                              WebViewScreen(
                                newsModelObj:
                                    cubit.breakingNewsModel?.articles?[index] ??
                                        Articles(),
                              ),
                            ),
                            articleObj:
                                cubit.breakingNewsModel?.articles?[index] ??
                                    Articles(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CategoryNewsAndViewAll(sharedCubit: sharedCubit),
                verticalSpacing(10.h),
                CategoriesListView(cubit: cubit),
                verticalSpacing(20.h),
              ],
            ),
          ),
          CategoryNewsListView(
            isCategoryScreen: false,
            cubit: cubit,
          ),
        ],
      ),
    );
  }
}
