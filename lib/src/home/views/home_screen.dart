import 'package:flutter/material.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/src/home/widgets/meditation_graph.dart';
import 'package:meditation_friend_app/src/home/widgets/quote_slider.dart';
import 'package:meditation_friend_app/src/home/widgets/start_meditation_player_btn.dart';
import 'package:meditation_friend_app/src/home/widgets/top_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kSkyBlue,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: const [
          SizedBox(height: 20),
          TopImage(),
          QuoteSlider(),
          SizedBox(height: 10),
          StartMeditationPlayerBtn(),
          SizedBox(height: 10),
          AttendanceCheck(),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
