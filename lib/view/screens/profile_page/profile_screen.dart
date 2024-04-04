import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_news/view/components/widgets/app_bar_custom/sliver_app_bar_custom.dart';
import 'package:last_news/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:last_news/view_model/cubit/shared_home_cubit/shared_home_cubit.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:last_news/view_model/utils/functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is ChangeLanguageState) {
                  if (cubit.isArabic) {
                    showToast(
                      msg: 'News Changed To Egyptian News',
                      context: context,
                    );
                  } else {
                    showToast(
                      msg: 'News Changed To American News',
                      context: context,
                    );
                  }
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    secondary: const Icon(
                      Icons.language_sharp,
                      color: AppColors.blue,
                    ),
                    title: const Text(
                      "Change News To Arabic",
                    ),
                    value: cubit.isArabic,
                    onChanged: (bool value) async {
                      cubit.changeLanguage(value);
                      await cubit.getBreakingNewsData();
                      await cubit.getSelectedCategoryNewsData();
                      SharedHomeCubit.get(context).controller.index = 0;
                    },
                    activeColor: AppColors.blue,
                    inactiveTrackColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
