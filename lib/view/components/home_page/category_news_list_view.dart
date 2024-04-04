import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_news/model/news_model.dart';
import 'package:last_news/view/components/widgets/news_card/long_news_tile_with_description.dart';
import 'package:last_news/view/components/widgets/news_card/short_news_tile.dart';
import 'package:last_news/view/screens/webview/web_view_screen.dart';
import 'package:last_news/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:last_news/view_model/utils/navigation.dart';

class CategoryNewsListView extends StatelessWidget {
  const CategoryNewsListView({
    super.key,
    required this.isCategoryScreen,
    required this.cubit,
  });

  final HomeCubit cubit;
  final bool isCategoryScreen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Visibility(
          visible: state is GetSelectedCategoryLoadingState,
          replacement: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => isCategoryScreen
                  ? NewsTileWithDescription(
                      onTap: () => Navigation.push(
                        context,
                        WebViewScreen(
                          newsModelObj:
                              cubit.categoryNewsModel?.articles?[index] ??
                                  Articles(),
                        ),
                      ),
                      articleObj: cubit.categoryNewsModel?.articles?[index] ??
                          Articles(),
                    )
                  : ShortNewsTile(
                      onTap: () => Navigation.push(
                        context,
                        WebViewScreen(
                          newsModelObj:
                              cubit.categoryNewsModel?.articles?[index] ??
                                  Articles(),
                        ),
                      ),
                      articleObj: cubit.categoryNewsModel?.articles?[index] ??
                          Articles(),
                    ),
              childCount: isCategoryScreen
                  ? cubit.categoryNewsModel?.articles?.length
                  : 10,
            ),
          ),
          child: const SliverToBoxAdapter(
            child: Center(
                child: CircularProgressIndicator(
              color: AppColors.primary,
            )),
          ),
        );
      },
    );
  }
}
