import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:last_news/view_model/utils/images.dart';

import '../../../../model/news_model.dart';
import '../../../../view_model/utils/colors.dart';
import '../../../../view_model/utils/functions.dart';
import '../../../../view_model/utils/styles.dart';

class ShortNewsTile extends StatelessWidget {
  const ShortNewsTile({
    super.key,
    required this.articleObj,
    required this.onTap,
  });

  final Articles articleObj;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 136.h,
        margin: EdgeInsets.only(left: 22.w, bottom: 20.h, right: 22.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 1,
              offset: Offset(0.0, 0.1),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage.assetNetwork(
                  image: articleObj.urlToImage ??
                      "https://demofree.sirv.com/nope-not-here.jpg",
                  placeholder: AppImages.noImage,
                  fadeInDuration: const Duration(seconds: 1),
                  fadeInCurve: Curves.bounceInOut,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  placeholderFit: BoxFit.cover,
                ),
              ),
            ),
            horizontalSpacing(10.h),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articleObj.title ?? "",
                      style: AppTextStyles.font14PrimarySemiBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpacing(7.h),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        articleObj.source?.name ?? "NO AUTHOR",
                        style: AppTextStyles.font11WhiteRegular,
                      ),
                    ),
                    verticalSpacing(7.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.timeCircleIcon,
                          fit: BoxFit.scaleDown,
                          colorFilter: const ColorFilter.mode(
                            AppColors.lightGray,
                            BlendMode.srcIn,
                          ),
                        ),
                        horizontalSpacing(5),
                        Text(
                          articleObj.publishedAt ?? "",
                          style: AppTextStyles.font10LighterGrayRegular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
