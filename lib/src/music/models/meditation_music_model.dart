import 'dart:convert';

List<MeditationMusic> meditationMusicFromJson(String str) {
  return List<MeditationMusic>.from(
    json.decode(str).map((x) => MeditationMusic.fromJson(x)),
  );
}

String meditationMusicToJson(MeditationMusic data) =>
    json.encode(data.toJson());

class MeditationMusic {
  final int id;
  final String title; // 명상 세션 제목
  final String description; // 명상 세션 설명
  final String imageUrl; // 명상 이미지 URL
  final String musicUrl;
  final int duration; // 명상 시간 (초 단위)

  MeditationMusic({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.musicUrl,
    required this.duration,
  });

  factory MeditationMusic.fromJson(Map<String, dynamic> json) {
    return MeditationMusic(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      imageUrl: json["imageUrl"],
      musicUrl: json["musicUrl"],
      duration: json["duration"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "imageUrl": imageUrl,
    "musicUrl": musicUrl,
    "duration": duration,
  };
}
