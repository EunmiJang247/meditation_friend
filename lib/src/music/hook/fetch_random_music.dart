import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:meditation_friend_app/common/utils/environment.dart';
import 'package:meditation_friend_app/src/music/hook/results/meditation_musics_results.dart';
import 'package:meditation_friend_app/src/music/models/meditation_music_model.dart';

FetchMeditationMusics fetchMeditatioMusic() {
  final meditationMusics = useState<List<MeditationMusic>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse(
        '${Environment.appBaseUrl}/api/meditation-muics/random',
      );

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final decodedString = utf8.decode(response.bodyBytes);
        final music = meditationMusicFromJson(decodedString);
        meditationMusics.value = music;
      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return;
  }, const []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchMeditationMusics(
    meditationMusics: meditationMusics.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
