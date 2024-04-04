import 'package:flutter/material.dart';
import 'package:last_news/view_model/utils/colors.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.lightGrayishYellow,
    fontFamily: "SF-Pro-Text",
    primaryColor: AppColors.primary,
    /*pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),*/
  );
}
