import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_friend_app/src/auth/views/login_screen.dart';
import 'package:meditation_friend_app/src/home/views/attendance_screen.dart';
import 'package:meditation_friend_app/src/music/screens/music_playing.dart';
import 'package:meditation_friend_app/src/onboarding/views/onboarding_screen.dart';
import 'package:meditation_friend_app/src/splashscreen/views/splashscreen_page.dart';

import '../../src/entrypoint/views/entrypoint.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => AppEntryPoint()),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/music',
      builder: (BuildContext context, GoRouterState state) {
        return const MusicPlaying();
      },
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/attendance',
      builder: (context, state) => const AttendancePage(),
    ),
  ],
);

GoRouter get router => _router;
