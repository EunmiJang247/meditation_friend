import 'package:audio_service/audio_service.dart';
// audio_service 패키지는 백그라운드 오디오 재생, 잠금화면 컨트롤,
// 알림바 제어 등을 가능하게 해주는 미들웨어 역할
import 'package:just_audio/just_audio.dart';

class MeditationAudioHandler extends BaseAudioHandler {
  // Flutter에서 오디오를 백그라운드에서 재생할 수 있도록 도와주는 구조
  // BaseAudioHandler는 audio_service가 제공하는 핵심 추상 클래스
  // 이 클래스는 오디오 재생 제어 요청을 받는 서비스 역할을 하며, Android에선 ForegroundService로 실행
  // 이 클래스를 통해 Flutter 앱은 시스템에 "나는 오디오 재생 중이야"라고 알릴 수 있게 됌
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  MeditationAudioHandler() {
    _audioPlayer.playbackEventStream.listen((event) {
      playbackState.add(
        playbackState.value.copyWith(
          playing: _audioPlayer.playing,
          processingState: AudioProcessingState.ready,
        ),
      );
    });
  }

  Future<void> playUrl(String url) async {
    await _audioPlayer.setUrl(url);
    _audioPlayer.play();
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  @override
  Future<void> stop() async {
    await _audioPlayer.stop();
    return super.stop();
  }

  // 🔥 여기 추가
  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }

  Stream<Duration> get positionStream => _audioPlayer.positionStream;
  Duration? get duration => _audioPlayer.duration;
}
