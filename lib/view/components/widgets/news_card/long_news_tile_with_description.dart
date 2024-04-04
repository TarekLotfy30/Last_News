import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_news/view_model/utils/functions.dart';
import 'package:last_news/view_model/utils/images.dart';
import 'package:last_news/view_model/utils/styles.dart';

import '../../../../model/news_model.dart';
import '../../../../view_model/utils/colors.dart';

class NewsTileWithDescription extends StatelessWidget {
  const NewsTileWithDescription({
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
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
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
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
              child: FadeInImage.assetNetwork(
                image: articleObj.urlToImage ??
                    "https://demofree.sirv.com/nope-not-here.jpg",
                placeholder: AppImages.noImage,
                fadeInDuration: const Duration(seconds: 1),
                fadeInCurve: Curves.bounceInOut,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.h,
                placeholderFit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                  verticalSpacing(7.h),
                  Text(
                    articleObj.title ?? "",
                    style: AppTextStyles.font14PrimarySemiBold,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    articleObj.description ?? "",
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
                      style: AppTextStyles.font11WhiteRegular,
                    ),
                  ),
                  verticalSpacing(7.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
