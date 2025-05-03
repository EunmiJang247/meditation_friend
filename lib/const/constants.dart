import 'package:flutter/material.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/src/home/models/categories_model.dart';
import 'package:meditation_friend_app/src/music/models/meditation_music_model.dart';

LinearGradient kGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Kolors.kPrimaryLight, Kolors.kWhite, Kolors.kPrimary],
);

LinearGradient kPGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Kolors.kPrimaryLight,
    Kolors.kPrimaryLight.withOpacity(0.7),
    Kolors.kPrimary,
  ],
);

LinearGradient kBtnGradient = const LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.bottomRight,
  colors: [Kolors.kPrimaryLight, Kolors.kWhite],
);

BorderRadiusGeometry kClippingRadius = const BorderRadius.only(
  topLeft: Radius.circular(20),
  topRight: Radius.circular(20),
);

BorderRadiusGeometry kRadiusAll = BorderRadius.circular(12);

BorderRadiusGeometry kRadiusTop = const BorderRadius.only(
  topLeft: Radius.circular(9),
  topRight: Radius.circular(9),
);

BorderRadiusGeometry kRadiusBottom = const BorderRadius.only(
  bottomLeft: Radius.circular(12),
  bottomRight: Radius.circular(12),
);

Widget Function(BuildContext, String)? placeholder =
    (p0, p1) =>
        Image.asset('assets/images/placeholder.webp', fit: BoxFit.cover);

Widget Function(BuildContext, String, Object)? errorWidget =
    (p0, p1, p3) =>
        Image.asset('assets/images/placeholder.webp', fit: BoxFit.cover);

List<Quote> quotes = [
  Quote(author: "파울로 코엘료", quote: "언제나 현재에 집중할 수 있다면 행복할 것이다."),
  Quote(author: "달라이 라마", quote: "행복은 이미 우리 안에 있습니다.\n 그것을 인식하는 것이 중요합니다."),
  Quote(author: "틱낫한", quote: "지금 이 순간이 당신의 삶입니다.\n 숨을 들이쉬며 그걸 느껴보세요."),
  Quote(author: "에크하르트 톨레", quote: "지금 이 순간을 받아들이는 것이\n 고통을 끝내는 열쇠입니다."),
  Quote(author: "공자", quote: "마음이 평화로우면 온 세상이 평화롭다."),
  Quote(author: "마더 테레사", quote: "작은 일에도 사랑을 담아 하세요.\n 그것이 세상을 바꿉니다."),
  Quote(author: "루미", quote: "당신이 찾고 있는 모든 답은 당신 안에 있습니다."),
  Quote(author: "소크라테스", quote: "너 자신을 알라.\n 거기서부터 모든 것이 시작된다."),
  Quote(author: "칼 융", quote: "내면을 들여다보는 자는 깨어난다."),
  Quote(author: "부처", quote: "모든 것은 마음에서 비롯된다.\n 마음을 바꾸면 세상이 바뀐다."),
  Quote(author: "라오쯔", quote: "자연의 흐름을 따를 때 평온을 찾는다."),
  Quote(author: "헬렌 켈러", quote: "희망은 어둠 속에서도 빛나는 별과 같습니다."),
  Quote(author: "레프 톨스토이", quote: "행복은 우리가 사랑하는 사람과 함께 사는 것이다."),
  Quote(author: "마하트마 간디", quote: "당신이 바라는 변화가 되어라."),
  Quote(author: "에이브러햄 링컨", quote: "대부분의 사람들은\n 자신이 마음먹은 만큼 행복하다."),
];

List<MeditationMusic> meditationMusics = [
  MeditationMusic(
    id: 1,
    title: "파울로 코엘료",
    description: "언제나 현재에 집중할 수 있다면 행복할 것이다. 언제나 현재에 집중할 수 있다면 행복할 것이다.",
    imageUrl:
        "https://img.freepik.com/free-vector/elegant-ramadan-kareem-decorative-festival-card_1017-23873.jpg",
    musicUrl:
        "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
    duration: 120,
  ),
];
