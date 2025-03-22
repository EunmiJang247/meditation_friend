import 'package:flutter/material.dart';
import 'package:meditation_friend_app/src/music/models/meditation_music_model.dart';

class FetchMeditationMusics {
  final List<MeditationMusic> meditationMusics;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;

  FetchMeditationMusics({
    required this.meditationMusics,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}
