import 'package:flutter/material.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kSkyBlue,
      body: Center(child: Text('MyPage')),
    );
  }
}
