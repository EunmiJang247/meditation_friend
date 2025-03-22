import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/common/widgets/reusable_text.dart';
import 'package:meditation_friend_app/const/resource.dart';

class StartMeditationPlayerBtn extends StatelessWidget {
  const StartMeditationPlayerBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/music');
      },
      child: Card(
        color: Kolors.kWhite,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                text: '오늘의 명상 시작하기',
                style: appStyle(16, Kolors.kPrimary, FontWeight.normal),
              ),
              const SizedBox(height: 16),
              Image.asset(
                R.ASSETS_MUSIC_BAR,
                width: ScreenUtil().screenWidth - 80,
              ),
              const SizedBox(height: 16),
              Image.asset(R.ASSETS_PLAY_BUTTON, width: 180),
            ],
          ),
        ),
      ),
    );
  }
}
