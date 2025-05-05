// 입장 시 자동 재생
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:meditation_friend_app/common/utils/enums.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/src/music/contollers/meditation_music_notifier.dart';
import 'package:provider/provider.dart';

class MusicPlayerWidget extends StatefulWidget {
  const MusicPlayerWidget({super.key, required this.musicUrl});
  final String musicUrl; // null 허용 X, 필수 값

  @override
  _MusicPlayerWidgetState createState() => _MusicPlayerWidgetState();
}

class _MusicPlayerWidgetState extends State<MusicPlayerWidget> {
  // late MeditationMusicNotifier _notifier;
  late String currentUrl;
  late String musicUrl;

  @override
  void initState() {
    super.initState();
    // _notifier = context.read<MeditationMusicNotifier>();
    currentUrl = "";
    musicUrl = widget.musicUrl;

    // _notifier.play(musicUrl); // 자동 재생 위임

    // 🎵 플레이어 상태 변화 감지 (한 번만 실행)
    // _audioPlayer.playerStateStream.listen((state) {
    //   print('🎵 플레이어 상태 변경: ${state.playing}, ${state.processingState}');

    //   if (state.playing && state.processingState == ProcessingState.ready) {
    //     context.read<MeditationMusicNotifier>().setPlayingType(
    //       PlayingType.playing,
    //     );
    //   } else if (!state.playing &&
    //       state.processingState == ProcessingState.ready) {
    //     context.read<MeditationMusicNotifier>().setPlayingType(
    //       PlayingType.pause,
    //     );
    //   } else if (state.processingState == ProcessingState.loading) {
    //     context.read<MeditationMusicNotifier>().setPlayingType(
    //       PlayingType.loading,
    //     );
    //   } else if (state.processingState == ProcessingState.buffering) {
    //     context.read<MeditationMusicNotifier>().setPlayingType(
    //       PlayingType.loading,
    //     );
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Future<void> autoPlay() async {
  //   final notifier = context.read<MeditationMusicNotifier>();

  //   if (currentUrl != musicUrl) {
  //     print('🎵 새로운 음악 로드: $musicUrl');
  //     await notifier.play(musicUrl); // 내부적으로 setUrl → play 처리
  //     currentUrl = musicUrl;
  //   } else {
  //     print('▶️ 이전 음악 그대로 재생');
  //     await notifier.play(musicUrl); // 같은 URL이라도 재생 시도
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<MeditationMusicNotifier>(
      builder: (context, musicNotifier, child) {
        if (!musicNotifier.isInitialized) {
          return const CircularProgressIndicator(); // 또는 SizedBox.shrink()
        }
        return Column(
          children: [
            StreamBuilder<Duration>(
              stream: musicNotifier.positionStream, // 🔹 현재 재생 위치 스트림
              builder: (context, snapshot) {
                final duration = snapshot.data ?? Duration.zero;
                final totalDuration =
                    musicNotifier.duration ?? Duration.zero; // ✅ 변경

                return Slider(
                  value: duration.inSeconds.toDouble(),
                  min: 0,
                  max: totalDuration.inSeconds.toDouble(),
                  onChanged: (value) async {
                    await AudioService.seekTo(
                      Duration(seconds: value.toInt()),
                    ); // ✅ seek는 AudioService API 사용
                  },
                  activeColor: Kolors.kOrange, // 🔹 재생중인 바 색상 (여기서 색상 변경)
                  inactiveColor: Colors.grey,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 라이크 버튼
                IconButton(
                  icon: Icon(MaterialIcons.favorite_outline, size: 48),
                  onPressed: () {
                    print('좋아요 버튼 클릭!');
                  },
                ),

                // 재생 버튼
                if (musicNotifier.playingStatus == PlayingType.pause)
                  IconButton(
                    onPressed: () async {
                      print('▶️ 재생 시도');
                      await musicNotifier.play(widget.musicUrl); // ✅ 변경
                    },
                    icon: Icon(MaterialIcons.play_arrow, size: 50),
                  ),

                // IconButton(
                //   onPressed: () async {
                //     try {
                //       print(currentUrl);
                //       print(musicUrl);
                //       if (currentUrl != musicUrl) {
                //         print('🎵 새로운 음악 로드: ${musicUrl}');
                //         await _audioPlayer.setUrl(musicUrl);
                //         currentUrl = musicUrl;
                //       } else {
                //         print('▶️ 이전 음악 그대로 재생');
                //       }

                //       try {
                //         await _audioPlayer.play();
                //       } catch (e) {
                //         print('❌ play() 실행 오류 발생: $e');
                //         throw e;
                //       }
                //     } catch (e) {
                //       print('❌ 음악 재생 오류: $e');
                //     }
                //   },
                //   icon: Icon(MaterialIcons.play_arrow, size: 50),
                // ),
                // 로딩 버튼
                if (musicNotifier.playingStatus == PlayingType.loading)
                  const CircularProgressIndicator(),
                // 멈춤 버튼
                // if (musicNotifier.playingStatus == PlayingType.playing)
                //   IconButton(
                //     onPressed: () async {
                //       try {
                //         await _audioPlayer.pause();
                //       } catch (e) {
                //         print('❌ pause() 실행 중 오류 발생: $e');
                //       }
                //     },
                //     icon: Icon(MaterialIcons.pause, size: 50),
                //   ),
                if (musicNotifier.playingStatus == PlayingType.playing)
                  IconButton(
                    onPressed: () async {
                      musicNotifier.pause(); // ✅ 변경
                    },
                    icon: Icon(MaterialIcons.pause, size: 50),
                  ),

                // 다음곡 버튼
                IconButton(
                  icon: const Icon(Icons.skip_next, size: 48),
                  onPressed: () {
                    print('다음곡 버튼 클릭!');
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
