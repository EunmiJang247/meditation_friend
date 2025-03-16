import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/common/widgets/reusable_text.dart';
import 'package:meditation_friend_app/const/resource.dart';
import 'package:meditation_friend_app/src/home/contollers/meditation_music_notifier.dart';
import 'package:meditation_friend_app/src/music/widgets/music_player.dart';
import 'package:provider/provider.dart';

class MusicPlaying extends StatefulWidget {
  const MusicPlaying({super.key});

  @override
  State<MusicPlaying> createState() => _MusicPlayingState();
}

class _MusicPlayingState extends State<MusicPlaying> {
  // 내가 들은 명상 리스트에 현재 음악을 추가하기
  // 현재 명상말고 다른것 선택하는 버튼 필요

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kSkyBlue,
      appBar: AppBar(
        backgroundColor: Kolors.kSkyBlue,
        title: const Text('뮤직 재생'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // 뒤로 가기 아이콘
          onPressed: () {
            Navigator.pop(context); // 뒤로 가기
          },
        ),
      ),
      body: Consumer<MeditationMusicNotifier>(
        builder: (context, musicNotifier, child) {
          final music = musicNotifier.music;

          if (music == null) {
            return Center(child: Text('현재 음악이 설정되지 않았습니다.'));
          }

          // 현재 음악이 설정되어 있으면 해당 정보를 화면에 표시
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (music.imageUrl != "")
                    CachedNetworkImage(
                      imageUrl: music.imageUrl,
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
                    text: music.title,
                    style: appStyle(16, Kolors.kDark, FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    music.description,
                    style: appStyle(14, Kolors.kDark, FontWeight.normal),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  MusicPlayerWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
