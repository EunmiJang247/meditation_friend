import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/common/widgets/reusable_text.dart';
import 'package:meditation_friend_app/const/resource.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:meditation_friend_app/src/home/contollers/meditation_music_notifier.dart';
import 'package:meditation_friend_app/const/constants.dart';

class StartMeditationPlayerBtn extends StatelessWidget {
  const StartMeditationPlayerBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return GestureDetector(
      onTap: () {
        final randomMusic =
            meditationMusics[random.nextInt(meditationMusics.length)];
        final meditationMusicNotifier = Provider.of<MeditationMusicNotifier>(
          context,
          listen: false,
        );
        meditationMusicNotifier.setMusic(randomMusic);
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
