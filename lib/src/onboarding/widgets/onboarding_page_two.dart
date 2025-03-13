import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/utils/kstrings.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/const/resource.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Image.asset(R.ASSETS_IMAGES_WISHLIST_PNG, fit: BoxFit.cover),
          Positioned(
            bottom: 150,
            left: 30,
            right: 30,
            child: Text(
              AppText.kOnboardHome,
              textAlign: TextAlign.center,
              style: appStyle(11, Kolors.kGray, FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
