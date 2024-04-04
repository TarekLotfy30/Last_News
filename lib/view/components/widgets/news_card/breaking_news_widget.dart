import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_news/model/news_model.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:last_news/view_model/utils/functions.dart';
import 'package:last_news/view_model/utils/images.dart';
import 'package:last_news/view_model/utils/styles.dart';

class BreakingNewsWidget extends StatelessWidget {
  const BreakingNewsWidget({
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
        width: 270.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        margin: EdgeInsets.only(left: 22.w),
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
            Expanded(
              flex: 3,
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
                  placeholderFit: BoxFit.cover,
                ),
              ),
            ),
            verticalSpacing(10.h),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articleObj.title ?? "",
                    style: AppTextStyles.font15PrimaryBold,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpacing(7.h),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      articleObj.source?.name ?? "NO AUTHOR",
                      style: AppTextStyles.font13WhiteRegular,
                    ),
                  ),
                  verticalSpacing(7.h),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
