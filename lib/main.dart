import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meditation_friend_app/common/utils/app_routes.dart';
import 'package:meditation_friend_app/common/utils/environment.dart';
import 'package:meditation_friend_app/common/utils/kstrings.dart';
import 'package:meditation_friend_app/src/auth/contollers/auth_notifier.dart';
import 'package:meditation_friend_app/src/auth/contollers/password_notifier.dart';
import 'package:meditation_friend_app/src/music/contollers/meditation_music_notifier.dart';
import 'package:meditation_friend_app/src/splashscreen/views/splashscreen_page.dart';
import 'package:provider/provider.dart';
import 'package:meditation_friend_app/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:intl/date_symbol_data_local.dart'; // 날짜 데이터 초기화
import 'package:flutter_localizations/flutter_localizations.dart'; // 로케일 지원 추가

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR', null); // 한국어 로캘 데이터 초기화
  await dotenv.load(fileName: Environment.fileName); // env 파일을 돌려줌
  GetStorage.init(); // 로컬 스토리지에 접근

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabIndexNotifier()),
        ChangeNotifierProvider(
          create: (_) => MeditationMusicNotifier(),
          lazy: false, // 앱 시작 시 바로 초기화해서 dispose 보장
        ), // ← 여기서 생성자 호출됨 → _init() 실행
        ChangeNotifierProvider(create: (_) => AuthNotifier()),
        ChangeNotifierProvider(create: (_) => PasswordNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      // 화면이 꺼지지 않고 앱이 완전히 종료될 때만 음악 멈춤
      final musicNotifier = Provider.of<MeditationMusicNotifier>(
        context,
        listen: false,
      );
      musicNotifier.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppText.kAppName,
          theme: ThemeData(useMaterial3: true),
          routerConfig: router,
          locale: const Locale('ko', 'KR'),
          supportedLocales: const [
            Locale('ko', 'KR'), // 한국어
            Locale('en', 'US'), // 영어 (필요할 경우 추가)
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate, // iOS 스타일 지원
          ],
        );
      },
      child: const SplashScreen(),
    );
  }
}
