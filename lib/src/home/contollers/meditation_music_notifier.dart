import 'package:flutter/widgets.dart';
import 'package:meditation_friend_app/common/utils/enums.dart';
import 'package:meditation_friend_app/src/home/models/meditation_music_model.dart';

class MeditationMusicNotifier with ChangeNotifier {
  MeditationMusic? _music;
  MeditationMusic? get music => _music;
  PlayingType playingStatus = PlayingType.pause;

  void setMusic(MeditationMusic music) {
    _music = music;
    notifyListeners();
  }

  void setPlayingType(PlayingType p) {
    playingStatus = p;
    notifyListeners();
  }
}
