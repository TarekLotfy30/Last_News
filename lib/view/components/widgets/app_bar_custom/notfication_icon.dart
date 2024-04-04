import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:last_news/view_model/utils/images.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: CircleAvatar(
        radius: 15.r,
        backgroundColor: AppColors.veryDarkGray.withOpacity(0.5),
        child: SvgPicture.asset(
          AppImages.notificationIcon,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          //color: AppColors.white,
        ),
      ),
    );
  }
}