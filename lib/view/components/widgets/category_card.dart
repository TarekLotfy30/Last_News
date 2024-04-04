import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_news/model/category_card_model.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:last_news/view_model/utils/styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryCardObj,
    this.onTap,
  });

  final CategoryCardModel categoryCardObj;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
      backgroundColor: AppColors.darkGray,
      label: Text(
        categoryCardObj.title,
        style: AppTextStyles.font15PrimaryBold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: const BorderSide(color: AppColors.lightGray),
      ),
      avatar: SvgPicture.asset(
        categoryCardObj.icon,
        height: 17.h,
        width: 17.w,
        fit: BoxFit.cover,
      ),
      onPressed: onTap,
    );
  }
}
