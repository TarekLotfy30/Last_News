import 'package:flutter/material.dart';
import 'package:last_news/view/components/onboarding/background_container.dart';
import 'package:last_news/view/components/onboarding/foreground_container.dart';
import 'package:last_news/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:last_news/view_model/utils/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundContainer(),
            ForegroundContainer(cubit: cubit),
          ],
        ),
      ),
    );
  }
}
