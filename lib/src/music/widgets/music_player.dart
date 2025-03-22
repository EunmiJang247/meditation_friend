// 입장 시 자동 재생
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditation_friend_app/common/utils/enums.dart';
import 'package:meditation_friend_app/src/music/contollers/meditation_music_notifier.dart';
import 'package:provider/provider.dart';

class MusicPlayerWidget extends StatefulWidget {
  const MusicPlayerWidget({super.key, required this.musicUrl});
  final String musicUrl; // null 허용 X, 필수 값

  @override
  _MusicPlayerWidgetState createState() => _MusicPlayerWidgetState();
}

class _MusicPlayerWidgetState extends State<MusicPlayerWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late String currentUrl = "";
  late String musicUrl;

  Future<void> autoPlay() async {
    if (currentUrl != musicUrl) {
      // 새로운 음악이거나 첫 재생이면 setUrl 실행
      print('🎵 새로운 음악 로드: ${musicUrl}');
      await _audioPlayer.setUrl(musicUrl);
      currentUrl = musicUrl;
    } else {
      print('▶️ 이전 음악 그대로 재생');
    }

    try {
      await _audioPlayer.play(); // play()를 실행하고 대기
    } catch (e) {
      print('❌ play() 실행 오류 발생: $e');
      throw e; // 예외를 던져서 문제를 명확히 확인
    }
  }

  @override
  void initState() {
    super.initState();
    musicUrl = widget.musicUrl;

    autoPlay();

    // 🎵 플레이어 상태 변화 감지 (한 번만 실행)
    _audioPlayer.playerStateStream.listen((state) {
      print('🎵 플레이어 상태 변경: ${state.playing}, ${state.processingState}');

      if (state.playing && state.processingState == ProcessingState.ready) {
        context.read<MeditationMusicNotifier>().setPlayingType(
          PlayingType.playing,
        );
      } else if (!state.playing &&
          state.processingState == ProcessingState.ready) {
        context.read<MeditationMusicNotifier>().setPlayingType(
          PlayingType.pause,
        );
      } else if (state.processingState == ProcessingState.loading) {
        context.read<MeditationMusicNotifier>().setPlayingType(
          PlayingType.loading,
        );
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MeditationMusicNotifier>(
      builder: (context, musicNotifier, child) {
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
                    print(currentUrl);
                    print(musicUrl);
                    if (currentUrl != musicUrl) {
                      print('🎵 새로운 음악 로드: ${musicUrl}');
                      await _audioPlayer.setUrl(musicUrl);
                      currentUrl = musicUrl;
                    } else {
                      print('▶️ 이전 음악 그대로 재생');
                    }

                    try {
                      await _audioPlayer.play();
                    } catch (e) {
                      print('❌ play() 실행 오류 발생: $e');
                      throw e;
                    }
                  } catch (e) {
                    print('❌ 음악 재생 오류: $e');
                  }
                },
                icon: Icon(MaterialIcons.play_arrow, size: 50),
              ),
            // 로딩 버튼
            if (musicNotifier.playingStatus == PlayingType.loading)
              // Icon(MaterialIcons.warning),
              const CircularProgressIndicator(),
            // 멈춤 버튼
            if (musicNotifier.playingStatus == PlayingType.playing)
              IconButton(
                onPressed: () async {
                  try {
                    await _audioPlayer.pause();
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
