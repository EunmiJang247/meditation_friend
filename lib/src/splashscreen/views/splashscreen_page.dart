import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_friend_app/common/services/storage.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/const/resource.dart';

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
    await Future.delayed(const Duration(milliseconds: 2000), () {
      // 3초 후
      if (Storage().getBool('firstOpen') == null) {
        // 처음 방문한 유저라면 onboarding screen 으로
        GoRouter.of(context).go('/onboarding');
      } else {
        // 아니라면 homescreen 으로
        GoRouter.of(context).go('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(R.ASSETS_IMAGES_SPLASHSCREEN_PNG),
          ),
        ),
      ),
    );
  }
}
