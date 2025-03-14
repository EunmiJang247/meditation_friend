import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/common/widgets/custom_button.dart';
import 'package:meditation_friend_app/const/resource.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kSkyBlue,
      body: SafeArea(
        child: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Kolors.kSkyBlue, Colors.white, Kolors.kSkyBlue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  R.ASSETS_IMAGES_ONBOARDING_PNG,
                  width: ScreenUtil().screenWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      Text(
                        '내면의 여정에 \n오신 것을 환영합니다',
                        style: appStyle(34, Kolors.kDark, FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        '이제부터 당신의 내면을 탐색하는\n여정이 시작됩니다. 다양한 명상 세션과 함께\n마음의 균형을 찾아보세요',
                        style: appStyle(16, Kolors.kDark, FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      GradientBtn(
                        text: "시작하기",
                        onTap: () {
                          GoRouter.of(context).go('/home');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
