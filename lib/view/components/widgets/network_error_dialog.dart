import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_news/view/components/widgets/app_button_widget.dart';
import 'package:last_news/view_model/utils/functions.dart';
import 'package:last_news/view_model/utils/images.dart';
import 'package:last_news/view_model/utils/styles.dart';

class NetworkErrorDialog extends StatelessWidget {
  const NetworkErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Image.asset(
        AppImages.noInternet,
        height: 50.h,
        width: 50.w,
        color: Colors.white,
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Whoops!",
              style: AppTextStyles.font16WhiteBold,
              textAlign: TextAlign.center,
            ),
            verticalSpacing(10),
            Text(
              "No internet connection found.",
              style: AppTextStyles.font14WhiteMedium,
              textAlign: TextAlign.center,
            ),
            verticalSpacing(5),
            Text(
              "Check your connection and try again.",
              style: AppTextStyles.font12WhiteRegular,
              textAlign: TextAlign.center,
            ),
            verticalSpacing(10),
            AppButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Try again",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
