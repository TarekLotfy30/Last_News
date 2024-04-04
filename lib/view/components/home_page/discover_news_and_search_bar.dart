import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:last_news/view/screens/search/search_screen.dart';
import 'package:last_news/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:last_news/view_model/utils/functions.dart';
import 'package:last_news/view_model/utils/images.dart';
import 'package:last_news/view_model/utils/navigation.dart';
import 'package:last_news/view_model/utils/styles.dart';

class DiscoverNewsAndSearchBar extends StatelessWidget {
  const DiscoverNewsAndSearchBar({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Discover Breaking News",
            style: AppTextStyles.font17WhiteBold,
          ),
          verticalSpacing(7.h),
          Hero(
            tag: 'search',
            child: TextField(
              readOnly: true,
              keyboardType: TextInputType.none,
              onTap: () {
                ///Todo navigate to search
                Navigation.push(context, const SearchScreen());
              },
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 15.h,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppColors.lightGray),
                ),
                focusedBorder: OutlineInputBorder(
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
        ],
      ),
    );
  }
}
