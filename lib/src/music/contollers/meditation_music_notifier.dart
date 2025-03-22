import 'package:flutter/widgets.dart';
import 'package:meditation_friend_app/common/utils/enums.dart';

class MeditationMusicNotifier with ChangeNotifier {
  PlayingType playingStatus = PlayingType.pause;

  void setPlayingType(PlayingType p) {
    playingStatus = p;
    notifyListeners();
  }
}
