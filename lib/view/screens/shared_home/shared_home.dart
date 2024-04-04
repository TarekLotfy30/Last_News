import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_news/view_model/cubit/shared_home_cubit/shared_home_cubit.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SharedHome extends StatelessWidget {
  const SharedHome({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SharedHomeCubit.get(context);
    return BlocBuilder<SharedHomeCubit, SharedHomeState>(
      builder: (context, state) {
        return SafeArea(
          bottom: false,
          top: true,
          child: Scaffold(
            body: PersistentTabView(
              context,
              backgroundColor: AppColors.lightGrayishYellow,
              navBarHeight: 80.h,
              controller: cubit.controller,
              screens: cubit.navBarScreens(),
              items: cubit.navBarsItems(),
              confineInSafeArea: true,
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
                // Navigation Bar's items animation properties.
              itemAnimationProperties: const ItemAnimationProperties(
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              ),
                // Screen transition animation on change of selected tab.
              screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              navBarStyle: NavBarStyle.style3,
            ),
          ),
        );
      },
    );
  }
}
