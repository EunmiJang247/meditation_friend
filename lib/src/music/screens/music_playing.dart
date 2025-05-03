import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meditation_friend_app/common/services/storage.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/common/widgets/reusable_text.dart';
import 'package:meditation_friend_app/const/resource.dart';
import 'package:meditation_friend_app/src/music/hook/fetch_random_music.dart';
import 'package:meditation_friend_app/src/music/widgets/music_player.dart';

class MusicPlaying extends HookWidget {
  const MusicPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    String? sessionId = Storage().getString('sessionId');
    final results = fetchMeditatioMusic();
    final meditationMusics = results.meditationMusics;
    final isLoading = results.isLoading;
    final error = results.error;

    if (isLoading) {
      return Container(
        color: Kolors.kSkyBlue,
        child: const Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Kolors.kOrange,
            ),
          ),
        ),
      );
    }

    if (meditationMusics.isEmpty) {
      return Center(child: Text('음악이 없어요!'));
    }

    print("여기에요! http://192.168.0.22:85${meditationMusics[0].musicUrl}");

    return Scaffold(
      backgroundColor: Kolors.kSkyBlue,
      appBar: AppBar(
        backgroundColor: Kolors.kSkyBlue,
        title: const Text('뮤직 재생'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (meditationMusics[0].imageUrl != "")
                CachedNetworkImage(
                  imageUrl: meditationMusics[0].imageUrl,
                  fit: BoxFit.cover,
                  width: 300,
                  height: 300,
                )
              else
                Image.asset(
                  R.MUSICPLAYING,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 24),
              ReusableText(
                text: meditationMusics[0].title,
                style: appStyle(16, Kolors.kDark, FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                meditationMusics[0].description,
                style: appStyle(14, Kolors.kDark, FontWeight.normal),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              MusicPlayerWidget(
                musicUrl:
                    "http://192.168.0.22:85${meditationMusics[0].musicUrl}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
