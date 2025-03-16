import 'package:flutter/material.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/src/home/models/categories_model.dart';
import 'package:meditation_friend_app/src/home/models/meditation_music_model.dart';

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
    id: "1",
    title: "파울로 코엘료",
    description: "언제나 현재에 집중할 수 있다면 행복할 것이다. 언제나 현재에 집중할 수 있다면 행복할 것이다.",
    imageUrl:
        "https://img.freepik.com/free-vector/elegant-ramadan-kareem-decorative-festival-card_1017-23873.jpg",
    musicUrl:
        "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
    duration: 120,
  ),
  MeditationMusic(
    id: "2",
    title: "아인슈타인",
    description: "원자폭탄 우히히",
    imageUrl:
        "https://img.freepik.com/free-vector/elegant-ramadan-kareem-decorative-festival-card_1017-23873.jpg",
    musicUrl:
        "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
    duration: 150,
  ),
  MeditationMusic(
    id: "3",
    title: "스티브 잡스",
    description: "Stay hungry, stay foolish.",
    imageUrl:
        "https://img.freepik.com/free-vector/elegant-ramadan-kareem-decorative-festival-card_1017-23873.jpg",
    musicUrl:
        "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
    duration: 180,
  ),
  MeditationMusic(
    id: "4",
    title: "니체",
    description: "신은 죽었다.",
    imageUrl:
        "https://img.freepik.com/free-vector/elegant-ramadan-kareem-decorative-festival-card_1017-23873.jpg",
    musicUrl:
        "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
    duration: 200,
  ),
  MeditationMusic(
    id: "5",
    title: "헬렌 켈러",
    description: "행복의 문이 하나 닫히면 다른 문이 열린다.",
    imageUrl: "",
    musicUrl:
        "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
    duration: 220,
  ),
  MeditationMusic(
    id: "6",
    title: "톨스토이",
    description: "모든 행복한 가정은 서로 닮았다.",
    imageUrl:
        "https://img.freepik.com/free-vector/elegant-ramadan-kareem-decorative-festival-card_1017-23873.jpg",
    musicUrl:
        "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
    duration: 240,
  ),
  MeditationMusic(
    id: "7",
    title: "괴테",
    description: "시작하는 순간부터 이미 반은 성공한 것이다.",
    imageUrl:
        "https://img.freepik.com/free-vector/elegant-ramadan-kareem-decorative-festival-card_1017-23873.jpg",
    musicUrl:
        "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
    duration: 260,
  ),
  MeditationMusic(
    id: "8",
    title: "공자",
    description: "배우고 때때로 익히면 또한 기쁘지 아니한가?",
    imageUrl:
        "https://img.freepik.com/free-vector/elegant-ramadan-kareem-decorative-festival-card_1017-23873.jpg",
    musicUrl:
        "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
    duration: 280,
  ),
  MeditationMusic(
    id: "9",
    title: "칸트",
    description: "네가 대접받고 싶은 대로 남을 대접하라.",
    imageUrl:
        "https://img.freepik.com/free-vector/elegant-ramadan-kareem-decorative-festival-card_1017-23873.jpg",
    musicUrl:
        "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
    duration: 300,
  ),
  MeditationMusic(
    id: "10",
    title: "셰익스피어",
    description: "인생은 무대와 같다. 각자 자신의 역할을 할 뿐이다.",
    imageUrl:
        "https://img.freepik.com/free-vector/elegant-ramadan-kareem-decorative-festival-card_1017-23873.jpg",
    musicUrl:
        "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
    duration: 320,
  ),
];
