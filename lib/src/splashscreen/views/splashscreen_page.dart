import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_friend_app/common/services/storage.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/const/resource.dart';
import 'package:meditation_friend_app/src/splashscreen/widgets/custom_loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigator();
    super.initState();
  }

  _navigator() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      if (Storage().getBool('firstOpen') == null) {
        GoRouter.of(context).go('/onboarding');
      } else {
        GoRouter.of(context).go('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kSkyBlue,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const EllipsisLoadingIndicatorCustom(),
                  const SizedBox(height: 20),
                  Image.asset(
                    R.ASSETS_IMAGES_SPLASHSCREEN_PNG,
                    width: ScreenUtil().screenWidth - 100,
                  ),
                  const SizedBox(height: 40),
                ],
              ),

              Positioned(
                bottom: 30,
                left: 0,
                child: Image.asset(
                  R.ASSETS_IMAGES_SPLASHSCREEN_DOTDOT_PNG,
                  width: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
