import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_news/view_model/utils/images.dart';

import '../../../../model/news_model.dart';
import '../../../../view_model/utils/colors.dart';
import '../../../../view_model/utils/functions.dart';
import '../../../../view_model/utils/styles.dart';

class SearchNewsTile extends StatelessWidget {
  const SearchNewsTile({
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
      child: DecoratedBox(
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage.assetNetwork(
                  image: articleObj.urlToImage ??
                      "https://demofree.sirv.com/nope-not-here.jpg",
                  placeholder: AppImages.noImage,
                  fadeInDuration: const Duration(seconds: 1),
                  fadeInCurve: Curves.bounceInOut,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 90.h,
                  placeholderFit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articleObj.title ?? "",
                      style: AppTextStyles.font12PrimaryRegular,
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
                        style: AppTextStyles.font9WhiteRegular,
                      ),
                    ),
                    verticalSpacing(7.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: AppColors.lightGray,
                              size: 15.sp,
                            ),
                            horizontalSpacing(5),
                            Text(
                              "${articleObj.publishedAt?.substring(0, 10)}",
                              style: AppTextStyles.font13LighterGrayRegular,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.timeCircleIcon,
                              fit: BoxFit.scaleDown,
                              height: 15.h,
                              width: 15.w,
                              colorFilter: const ColorFilter.mode(
                                AppColors.lightGray,
                                BlendMode.srcIn,
                              ),
                            ),
                            horizontalSpacing(5),
                            Text(
                              "${articleObj.publishedAt?.substring(11, 16)}",
                              style: AppTextStyles.font13LighterGrayRegular,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
