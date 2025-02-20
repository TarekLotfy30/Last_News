import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_news/view/components/widgets/app_button_widget.dart';
import 'package:last_news/view/components/widgets/network_error_dialog.dart';
import 'package:last_news/view/screens/shared_home/shared_home.dart';
import 'package:last_news/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:last_news/view_model/utils/colors.dart';
import 'package:last_news/view_model/utils/functions.dart';
import 'package:last_news/view_model/utils/images.dart';
import 'package:last_news/view_model/utils/navigation.dart';
import 'package:last_news/view_model/utils/styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ForegroundContainer extends StatelessWidget {
  const ForegroundContainer({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.h),
      padding: EdgeInsets.only(top: 6.h, left: 20.w, right: 20.w),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(22).r,
          topRight: const Radius.circular(22).r,
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 4.h,
              width: 66.w,
              decoration: BoxDecoration(
                color: AppColors.lightGray.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(70).r,
              ),
            ),
            verticalSpacing(30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.onboarding,
                    fit: BoxFit.cover,
                  ),
                  verticalSpacing(16),
                  Text(
                    "Discover Breaking News! 🔥",
                    style: AppTextStyles.font18PrimaryBold,
                  ),
                  verticalSpacing(10),
                  Text(
                    "Make it easy for users to access the latest and "
                    "most recent news quickly and easily from a "
                    "single platform.",
                    style: AppTextStyles.font14VeryDarkGrayRegular,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            verticalSpacing(90),
            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is GetSelectedCategoryDataSuccessState) {
                  Navigation.pushAndRemove(context, const SharedHome());
                }
              },
              builder: (context, state) {
                return StreamBuilder<ConnectivityResult>(
                  builder: (context, snapshot) {
                    return AppButton(
                      onPressed: () async {
                        if (snapshot.data == ConnectivityResult.none) {
                          showCupertinoDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) => const NetworkErrorDialog(),
                          );
                        }
                        await cubit.getBreakingNewsData();
                        await cubit.getSelectedCategoryNewsData();
                      },
                      child: Visibility(
                        visible: state is BreakingNewsDataLoadingState ||
                            state is GetSelectedCategoryLoadingState,
                        replacement: Text(
                          "Continue",
                          style: AppTextStyles.font17WhiteBold,
                          textAlign: TextAlign.center,
                        ),
                        child: Center(
                          child: LoadingAnimationWidget.twistingDots(
                            leftDotColor: AppColors.white,
                            rightDotColor: AppColors.blue,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    );
                  },
                  stream: null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
