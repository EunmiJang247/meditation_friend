import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditation_friend_app/common/utils/enums.dart';
import 'package:meditation_friend_app/src/home/contollers/meditation_music_notifier.dart';
import 'package:provider/provider.dart';

class MusicPlayerWidget extends StatefulWidget {
  const MusicPlayerWidget({super.key});

  @override
  _MusicPlayerWidgetState createState() => _MusicPlayerWidgetState();
}

class _MusicPlayerWidgetState extends State<MusicPlayerWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? currentUrl; // 현재 재생 중인 음악 URL
  // bool isPlaying = false;
  // bool isLoading = false;
  // String? currentUrl;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
    }

    return Consumer<MeditationMusicNotifier>(
      builder: (context, musicNotifier, child) {
        print('호출!');
        print(musicNotifier.playingStatus);
        final music = musicNotifier.music;
        if (music == null) {
          return Center(child: Text('현재 음악이 설정되지 않았습니다.'));
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 라이크 버튼
            IconButton(
              icon: Icon(MaterialIcons.favorite_outline, size: 48),
              onPressed:
                  () => () {
                    //
                  },
            ),

            // 재생 버튼
            if (musicNotifier.playingStatus == PlayingType.pause)
              IconButton(
                onPressed: () async {
                  try {
                    musicNotifier.setPlayingType(PlayingType.loading);
                    // await _audioPlayer.setUrl(
                    //   musicNotifier.music?.musicUrl ?? '',
                    // );
                    if (currentUrl != music.musicUrl) {
                      // 새로운 음악이거나 첫 재생이면 setUrl 실행
                      print('🎵 새로운 음악 로드: ${music.musicUrl}');
                      await _audioPlayer.setUrl(music.musicUrl);
                      currentUrl = music.musicUrl;
                    } else {
                      print('▶️ 이전 음악 그대로 재생');
                    }

                    _audioPlayer
                        .play()
                        .then((_) {
                          musicNotifier.setPlayingType(PlayingType.playing);
                        })
                        .catchError((e) {
                          print('❌ play() 실패: $e');
                        });
                    musicNotifier.setPlayingType(PlayingType.playing);
                  } catch (e) {
                    print('❌ 음악 재생 오류: $e');
                  }
                },
                icon: Icon(MaterialIcons.play_arrow, size: 50),
              ),
            // 로딩 버튼
            if (musicNotifier.playingStatus == PlayingType.loading)
              Icon(MaterialIcons.warning),
            // 멈춤 버튼
            if (musicNotifier.playingStatus == PlayingType.playing)
              IconButton(
                onPressed: () async {
                  try {
                    musicNotifier.setPlayingType(PlayingType.loading);
                    await _audioPlayer.pause();
                    musicNotifier.setPlayingType(PlayingType.pause);
                  } catch (e) {
                    print('❌ pause() 실행 중 오류 발생: $e');
                  }
                },
                icon: Icon(MaterialIcons.pause, size: 50),
              ),
            // 다음곡 버튼
            IconButton(
              icon: const Icon(Icons.skip_next, size: 48),
              onPressed: () {
                //
              },
            ),
          ],
        );
      },
    );
  }
}
