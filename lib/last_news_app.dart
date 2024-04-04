import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_news/view/screens/onboarding/onboarding_screen.dart';
import 'package:last_news/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:last_news/view_model/cubit/shared_home_cubit/shared_home_cubit.dart';
import 'package:last_news/view_model/utils/app_theme.dart';

class LastNewsApp extends StatelessWidget {
  const LastNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SharedHomeCubit()),
          BlocProvider(create: (context) => HomeCubit()),
        ],
        child: MaterialApp(
          scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightMode,
          home: const OnBoardingScreen(),
        ),
      ),
    );
  }
}
