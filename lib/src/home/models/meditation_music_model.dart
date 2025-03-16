import 'dart:convert';

List<MeditationMusic> quoteFromJson(String str) => List<MeditationMusic>.from(
  json.decode(str).map((x) => MeditationMusic.fromJson(x)),
);

String meditationMusicToJson(List<MeditationMusic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MeditationMusic {
  final String id;
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

  factory MeditationMusic.fromJson(Map<String, dynamic> json) =>
      MeditationMusic(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        musicUrl: json["musicUrl"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "imageUrl": imageUrl,
    "musicUrl": musicUrl,
    "duration": duration,
  };
}
