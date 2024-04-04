import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_news/view/screens/all_news/all_news_screen.dart';
import 'package:last_news/view/screens/category/category_screen.dart';
import 'package:last_news/view/screens/home/home_screen.dart';
import 'package:last_news/view/screens/profile_page/profile_screen.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:last_news/view_model/utils/images.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

part 'shared_home_state.dart';

class SharedHomeCubit extends Cubit<SharedHomeState> {
  SharedHomeCubit() : super(HomeInitial());

  static SharedHomeCubit get(context) => BlocProvider.of(context);

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  List<Widget> navBarScreens() {
    return [
      const HomeScreen(),
      const AllNewsScreen(),
      const CategoryScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppImages.homeIcon,
          width: 30,
          height: 30,
        ),
        inactiveIcon: SvgPicture.asset(
          AppImages.homeIcon,
          colorFilter: const ColorFilter.mode(
            AppColors.lighterGray,
            BlendMode.srcIn,
          ),
          width: 30,
          height: 30,
        ),
        activeColorPrimary: AppColors.primary,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppImages.allNewsIcon,
          width: 30,
          height: 30,
        ),
        inactiveIcon: SvgPicture.asset(
          AppImages.allNewsIcon,
          colorFilter: const ColorFilter.mode(
            AppColors.lighterGray,
            BlendMode.srcIn,
          ),
          width: 30,
          height: 30,
        ),
        activeColorPrimary: AppColors.primary,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppImages.categoryIcon,
          width: 30,
          height: 30,
        ),
        inactiveIcon: SvgPicture.asset(
          AppImages.categoryIcon,
          colorFilter: const ColorFilter.mode(
            AppColors.lighterGray,
            BlendMode.srcIn,
          ),
          width: 30,
          height: 30,
        ),
        activeColorPrimary: AppColors.primary,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppImages.profileIcon,
          width: 30,
          height: 30,
        ),
        inactiveIcon: SvgPicture.asset(
          AppImages.profileIcon,
          colorFilter: const ColorFilter.mode(
            AppColors.lighterGray,
            BlendMode.srcIn,
          ),
          width: 30,
          height: 30,
        ),
        activeColorPrimary: AppColors.primary,
      ),
    ];
  }
}
