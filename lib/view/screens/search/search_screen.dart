import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_news/model/news_model.dart';
import 'package:last_news/view/components/widgets/news_card/search_news_tile.dart';
import 'package:last_news/view/screens/webview/web_view_screen.dart';
import 'package:last_news/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:last_news/view_model/utils/images.dart';
import 'package:last_news/view_model/utils/navigation.dart';
import 'package:last_news/view_model/utils/styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.white,
          ),
          onPressed: () {
            Navigation.pop(context);
            cubit.searchController.clear();
          },
        ),
        toolbarHeight: 80.h,
        backgroundColor: AppColors.primary,
        elevation: 0,
        titleSpacing: 0,
        // The search area here
        title: Hero(
          tag: 'search',
          child: TextFormField(
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: cubit.searchController,
            autofocus: true,
            cursorColor: AppColors.lightGray,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.search,
            style: AppTextStyles.font16LightGrayRegular,
            onChanged: (value) => cubit.search(text: value),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 15.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppColors.lightGray),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppColors.lightGray),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppColors.lightGray),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppColors.lightGray),
              ),
              hintText: 'Find Breaking News',
              prefixIcon: SvgPicture.asset(
                AppImages.searchIcon,
                fit: BoxFit.scaleDown,
                colorFilter: const ColorFilter.mode(
                  AppColors.lightGray,
                  BlendMode.srcIn,
                ),
                //color: AppColors.white,
              ),
              hintStyle: AppTextStyles.font16LightGrayRegular,
              filled: true,
              fillColor: AppColors.veryDarkGray,
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Visibility(
            visible: state is SearchLoadingState,
            replacement: cubit.searchController.text.isEmpty
                ? const SizedBox()
                : GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 22.h, vertical: 20.h),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.71,
                    ),
                    itemBuilder: (context, index) => SearchNewsTile(
                      articleObj:
                          cubit.searchNewsModel?.articles?[index] ?? Articles(),
                      onTap: () => Navigation.push(
                        context,
                        WebViewScreen(
                          newsModelObj:
                              cubit.searchNewsModel?.articles?[index] ??
                                  Articles(),
                        ),
                      ),
                    ),
                    itemCount: cubit.searchNewsModel?.articles?.length ?? 0,
                  ),
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          );
        },
      ),
    );
  }
}
