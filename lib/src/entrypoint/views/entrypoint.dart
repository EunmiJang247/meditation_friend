import 'package:flutter/material.dart';

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({super.key});
  // 여기에 네 개의 탭이 와야함

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('home')));
  }
}
