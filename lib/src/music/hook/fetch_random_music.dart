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
      print("Response: ${Environment.appBaseUrl}");

      final response = await http.get(url);
      print("Response 는요!: ${response.body}"); // -> 여기부터 안오는데?
      if (response.statusCode == 200) {
        final decodedString = utf8.decode(response.bodyBytes);
        final music = meditationMusicFromJson(decodedString);
        meditationMusics.value = music;
      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
      }
      isLoading.value = false;
    } catch (e) {
      error.value = e.toString();
      print("Error occurred: $e");
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, const []);

  return FetchMeditationMusics(
    meditationMusics: meditationMusics.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: fetchData,
  );
}
