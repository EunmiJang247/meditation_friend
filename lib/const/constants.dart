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
  Quote(
    author: "파울로코엘료",
    quote:
        "언제나 현재에 집중할 수 있다면 행복할 것이다. 언제나 현재에 집중할 수 있다면 행복할 것이다. 언제나 현재에 집중할 수 있다면 행복할 것이다.",
    imageUrl:
        "https://img.freepik.com/free-vector/elegant-ramadan-kareem-decorative-festival-card_1017-23873.jpg?t=st=1742014941~exp=1742018541~hmac=338b1e2756299baef95f13bc25c47673da13cc3de37b415d043a6ec392f1d023&w=1380",
  ),
  Quote(
    author: "아인슈타인",
    quote: "원자폭탄 우히히",
    imageUrl:
        "https://img.freepik.com/free-vector/elegant-ramadan-kareem-decorative-festival-card_1017-23873.jpg?t=st=1742014941~exp=1742018541~hmac=338b1e2756299baef95f13bc25c47673da13cc3de37b415d043a6ec392f1d023&w=1380",
  ),
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
