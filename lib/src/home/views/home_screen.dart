import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/const/resource.dart';
import 'package:meditation_friend_app/src/home/widgets/meditation_graph.dart';
import 'package:meditation_friend_app/src/home/widgets/quote_slider.dart';
import 'package:meditation_friend_app/src/home/widgets/start_meditation_player_btn.dart';
import 'package:meditation_friend_app/src/home/widgets/top_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // 여기서 명상 음악을 전해주기

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kSkyBlue,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          TopImage(),
          SizedBox(height: 4),
          QuoteSlider(),
          SizedBox(height: 10),
          StartMeditationPlayerBtn(),
          SizedBox(height: 10),
          LineChartSample2(),
        ],
      ),
    );
  }
}
