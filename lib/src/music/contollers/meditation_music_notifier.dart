import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/widgets.dart';
import 'package:meditation_friend_app/common/utils/enums.dart';
import 'package:meditation_friend_app/src/music/contollers/audio_handler.dart';

class MeditationMusicNotifier with ChangeNotifier {
  final Completer<void> _initCompleter = Completer<void>();
  late final MeditationAudioHandler _audioHandler;

  PlayingType playingStatus = PlayingType.pause;

  MeditationMusicNotifier() {
    _init();
  }

  Future<void> _init() async {
    _audioHandler = await AudioService.init(
      builder: () => MeditationAudioHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.moraesoft.meditation',
        androidNotificationChannelName: 'Meditation Audio',
        androidNotificationOngoing: false,
        // 이걸 false로 하면 앱이 백그라운드에 있거나 꺼질 때 서비스도 같이 종료될 수 있습니다
      ),
    );
    _initCompleter.complete();
    notifyListeners();

    _audioHandler.playbackState.listen((state) {
      print(
        '▶️ 상태: playing=${state.playing}, processing=${state.processingState}',
      );
      playingStatus = state.playing ? PlayingType.playing : PlayingType.pause;
      notifyListeners();
    });
  }

  Future<void> play(String url) async {
    await _initCompleter.future;
    await _audioHandler.playUrl(url);
  }

  Future<void> pause() async {
    print('오나요?');
    await _initCompleter.future;
    await _audioHandler.pause();
  }

  Future<void> stop() async {
    await _initCompleter.future;
    await _audioHandler.stop();
  }

  bool get isInitialized => _initCompleter.isCompleted;

  Stream<Duration> get positionStream =>
      _audioHandler.audioPlayer.positionStream;
  Duration? get duration => _audioHandler.audioPlayer.duration;

  @override
  void dispose() {
    if (_initCompleter.isCompleted) {
      // 앱 종료 이벤트에서 오디오를 멈추도록 명시적으로 stop()
      _audioHandler.stop();
      _audioHandler.dispose();
    }
    super.dispose();
  }
}
