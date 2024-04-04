import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_news/view/components/widgets/app_bar_custom/last_news_logo_and_name.dart';
import 'package:last_news/view/components/widgets/app_bar_custom/notfication_icon.dart';
import 'package:last_news/view_model/utils/colors.dart';

class SliverAppBarCustom extends StatelessWidget {
  const SliverAppBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      toolbarHeight: 60.h,
      backgroundColor: AppColors.primary,
      title: const LastNewsLogoAndName(),
      actions: const [
        NotificationIcon(),
      ],
    );
  }
}