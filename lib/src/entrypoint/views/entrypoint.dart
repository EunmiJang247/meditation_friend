import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/src/mypage/views/mypage_screen.dart';
import 'package:meditation_friend_app/src/home/views/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:meditation_friend_app/src/entrypoint/controllers/bottom_tab_notifier.dart';

class AppEntryPoint extends StatelessWidget {
  AppEntryPoint({super.key});
  List<Widget> pageList = [const HomePage(), const MyPage()];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
      builder: (context, tabIndexNotifier, child) {
        return Scaffold(
          backgroundColor: Kolors.kSkyBlue,
          body: SafeArea(
            child: Stack(
              children: [
                pageList[tabIndexNotifier.index],
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Theme(
                    data: Theme.of(
                      context,
                    ).copyWith(canvasColor: Colors.yellow),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Kolors.kWhite,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: BottomNavigationBar(
                          selectedFontSize: 12,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          showSelectedLabels: true,
                          showUnselectedLabels: false,
                          currentIndex: tabIndexNotifier.index,
                          selectedItemColor: Kolors.kOrange,
                          unselectedItemColor: Kolors.kGray,
                          unselectedIconTheme: const IconThemeData(
                            color: Kolors.kGray,
                          ),
                          onTap: (i) {
                            tabIndexNotifier.setIndex(i);
                          },
                          items: [
                            BottomNavigationBarItem(
                              icon:
                                  tabIndexNotifier.index == 0
                                      ? const Icon(
                                        MaterialCommunityIcons.home,
                                        color: Kolors.kOrange,
                                        size: 24,
                                      )
                                      : const Icon(
                                        MaterialCommunityIcons.home,
                                        color: Kolors.kGray,
                                        size: 24,
                                      ),
                              label: "HOME",
                            ),
                            BottomNavigationBarItem(
                              icon:
                                  tabIndexNotifier.index == 1
                                      ? const Icon(
                                        MaterialCommunityIcons.account,
                                        color: Kolors.kOrange,
                                        size: 24,
                                      )
                                      : const Icon(
                                        MaterialCommunityIcons.account,
                                        color: Kolors.kGray,
                                        size: 24,
                                      ),
                              label: "MYPAGE",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
