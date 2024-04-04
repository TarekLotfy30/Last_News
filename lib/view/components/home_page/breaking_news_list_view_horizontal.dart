/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_news/view/components/widgets/news_card/breaking_news_widget.dart';
import 'package:last_news/view/screens/webview/web_view_screen.dart';
import 'package:last_news/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:last_news/view_model/utils/navigation.dart';

import '../../../model/news_model.dart';

class BreakingNewsListViewHorizontal extends StatelessWidget {
  const BreakingNewsListViewHorizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context).breakingNewsModel?.articles;
    return SizedBox(
      height: 325.h,
      child: BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => BreakingNewsWidget(
          onTap: () => Navigation.push(
            context,
            WebViewScreen(
              newsModelObj: cubit?[index] ?? Articles(),
            ),
          ),
          articleObj: cubit?[index] ?? Articles(),
        ),
      );
  },
),
    );
  }
}
*/
