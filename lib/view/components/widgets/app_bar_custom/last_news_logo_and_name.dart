import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_news/view_model/utils/functions.dart';
import 'package:last_news/view_model/utils/images.dart';
import 'package:last_news/view_model/utils/styles.dart';

class LastNewsLogoAndName extends StatelessWidget {
  const LastNewsLogoAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpacing(10),
        Image.asset(
          AppImages.lastNewsLogo,
          width: 25.w,
          height: 20.h,
          fit: BoxFit.cover,
        ),
        horizontalSpacing(10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Last',
                style: AppTextStyles.font20WhiteSemiBold,
              ),
              TextSpan(
                text: 'News',
                style: AppTextStyles.font20LighterGrayRegular,
              ),
            ],
          ),
        ),
      ],
    );
  }
}