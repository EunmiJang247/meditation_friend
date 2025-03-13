import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_friend_app/common/services/storage.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/utils/kstrings.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/common/widgets/custom_button.dart';
import 'package:meditation_friend_app/common/widgets/reusable_text.dart';
import 'package:meditation_friend_app/const/resource.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Kolors.kWhite,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            SizedBox(height: 100),
            Image.asset(R.ASSETS_IMAGES_GETSTARTED_PNG),
            SizedBox(height: 30),
            Text(
              AppText.kWelcomeHeader,
              style: appStyle(24, Kolors.kPrimary, FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: ScreenUtil().screenWidth - 100,
              child: Text(
                AppText.kWelcomeMessage,
                textAlign: TextAlign.center,
                style: appStyle(12, Kolors.kGray, FontWeight.normal),
              ),
            ),
            SizedBox(height: 20),
            GradientBtn(
              text: AppText.kGetStarted,
              btnHieght: 35,
              btnWidth: ScreenUtil().screenWidth - 100,
              radius: 20,
              onTap: () {
                // TODO
                // Storage().setBool('firstOpen', true);
                context.go('/home');
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableText(
                  text: "Already have an account?",
                  style: appStyle(12, Kolors.kDark, FontWeight.normal),
                ),
                TextButton(
                  onPressed: () {
                    // 로그인 페이지로 이동
                    context.go('/login');
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
