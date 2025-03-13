import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:meditation_friend_app/src/onboarding/widgets/onboarding_page_one.dart';
import 'package:meditation_friend_app/src/onboarding/widgets/onboarding_page_two.dart';
import 'package:meditation_friend_app/src/onboarding/widgets/welcom_screen.dart';
import 'package:provider/provider.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: context.read<OnboardingNotifier>().selectedPage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final pro = Provider.of<OnboardingNotifier>(context);
    return Scaffold(
      // 프로바이더 쓰는 1 방법
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       TextButton(
      //         onPressed: () {
      //           context.read<OnboardingNotifier>().setSelectedPage = 4;
      //         },
      //         child: Text('Increement'),
      //       ),
      //       Text(context.watch<OnboardingNotifier>().selectedPage.toString()),
      //     ],
      //   ),
      // ), 아래와 같이 Consumer를 쓰는 방식으로 변경

      // 프로바이더 쓰는 2 방법
      // body: Consumer<OnboardingNotifier>(
      //   builder: (context, onboardingNotifier, child) {
      //     return Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         TextButton(
      //           onPressed: () {
      //             onboardingNotifier.setSelectedPage = 9;
      //           },
      //           child: Text('increment'),
      //         ),
      //         Text(onboardingNotifier.selectedPage.toString()),
      //       ],
      //     );
      //   },
      // ),

      // 프로바이더 쓰는 3 방법
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     TextButton(
      //       onPressed: () {
      //         pro.setSelectedPage = 111;
      //       },
      //       child: Text('Increment'),
      //     ),
      //     Text(pro.selectedPage.toString()),
      //   ],
      // ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (page) {
              context.read<OnboardingNotifier>().setSelectedPage = page;
              // print(page) 페이지 바뀔때마다 호출됨;
            },
            children: const [
              OnboardingScreenOne(),
              OnboardingScreenTwo(),
              WelcomScreen(),
            ],
          ),
          context.watch<OnboardingNotifier>().selectedPage == 2
              ? SizedBox.shrink()
              : Positioned(
                bottom: 50,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: ScreenUtil().screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      context.watch<OnboardingNotifier>().selectedPage == 0
                          ? SizedBox(width: 25)
                          : GestureDetector(
                            onTap: () {
                              _pageController.animateToPage(
                                context
                                        .read<OnboardingNotifier>()
                                        .selectedPage -
                                    1,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                              );
                            },
                            child: const Icon(
                              AntDesign.leftcircleo,
                              color: Kolors.kPrimary,
                              size: 30,
                            ),
                          ),
                      SizedBox(
                        width: ScreenUtil().screenWidth * 0.7,
                        height: 50,
                        child: PageViewDotIndicator(
                          currentItem:
                              context.watch<OnboardingNotifier>().selectedPage,
                          count: 3, // 점 개수
                          unselectedColor: Colors.black26,
                          selectedColor: Kolors.kPrimary,
                          duration: const Duration(milliseconds: 200),
                          onItemClicked: (index) {
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            context.read<OnboardingNotifier>().selectedPage + 1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Icon(
                          AntDesign.rightcircleo,
                          color: Kolors.kPrimary,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
