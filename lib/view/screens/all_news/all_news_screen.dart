import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_news/model/news_model.dart';
import 'package:last_news/view/components/widgets/app_bar_custom/sliver_app_bar_custom.dart';
import 'package:last_news/view/components/widgets/news_card/long_news_tile_with_description.dart';
import 'package:last_news/view/screens/webview/web_view_screen.dart';
import 'package:last_news/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:last_news/view_model/utils/functions.dart';
import 'package:last_news/view_model/utils/navigation.dart';
import 'package:last_news/view_model/utils/styles.dart';

class AllNewsScreen extends StatelessWidget {
  const AllNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverAppBarCustom(),
          SliverToBoxAdapter(
            child: verticalSpacing(15),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                "Hot Updates🔥",
                style: AppTextStyles.font17PrimaryBold,
              ),
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: cubit.breakingNewsModel?.articles?.length ?? 0,
                  (context, index) => NewsTileWithDescription(
                    onTap: () => Navigation.push(
                      context,
                      WebViewScreen(
                          newsModelObj:
                              cubit.breakingNewsModel?.articles?[index] ??
                                  Articles()),
                    ),
                    articleObj:
                        cubit.breakingNewsModel?.articles?[index] ?? Articles(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
