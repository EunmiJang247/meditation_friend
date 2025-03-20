import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_friend_app/common/services/storage.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/common/widgets/custom_button.dart';
import 'package:meditation_friend_app/common/widgets/reusable_text.dart';
import 'package:meditation_friend_app/src/auth/contollers/auth_notifier.dart';
import 'package:meditation_friend_app/src/auth/models/profile_model.dart';
import 'package:meditation_friend_app/src/auth/views/login_screen.dart';
import 'package:meditation_friend_app/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:meditation_friend_app/src/mypage/widgets/meditation_duration_sheet.dart';
import 'package:meditation_friend_app/src/mypage/widgets/meditation_gender_sheet.dart';
import 'package:meditation_friend_app/src/mypage/widgets/meditation_kind_sheet.dart';
import 'package:meditation_friend_app/src/mypage/widgets/meditation_alarm_time_sheet.dart';
import 'package:meditation_friend_app/src/mypage/widgets/tile_widget.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? sessionId = Storage().getString('sessionId');
    print(sessionId);
    if (sessionId == null) {
      return const LoginPage();
    }
    return Scaffold(
      backgroundColor: Kolors.kSkyBlue,
      body: Consumer<AuthNotifier>(
        builder: (context, authNotifier, child) {
          ProfileModel? user = authNotifier.getUserData();
          return ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Kolors.kOffWhite,
                  ),
                  const SizedBox(height: 20),
                  ReusableText(
                    text: user!.id.toString(),
                    style: appStyle(11, Kolors.kDark, FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ReusableText(
                      text: user.username.toString(),
                      style: appStyle(14, Kolors.kDark, FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    color: Kolors.kSkyBlue,
                    child: Column(
                      children: [
                        ProfileTileWidget(
                          title: "선호하는 명상종류",
                          leading: Octicons.check,
                          onTap: () => meditationKindBottomSheet(context),
                        ),
                        ProfileTileWidget(
                          title: "선호하는 시간(duration)",
                          leading: MaterialIcons.access_time,
                          onTap: () => meditationDurationBottomSheet(context),
                        ),
                        ProfileTileWidget(
                          title: "명상 알림 시간 설정",
                          leading: MaterialIcons.lock_clock,
                          onTap: () => meditationAlramTimeBottomSheet(context),
                        ),
                        ProfileTileWidget(
                          title: "선호하는 성별",
                          leading: Octicons.accessibility,
                          onTap: () => meditationGenderBottomSheet(context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: GradientBtn(
                      text: "로그아웃".toUpperCase(),
                      btnColor: Kolors.kOrange,
                      btnWidth: ScreenUtil().screenWidth - 40,
                      btnHieght: 45,
                      onTap: () {
                        Storage().removeKey('sessionId');
                        Storage().removeKey('userInfo');
                        context.read<TabIndexNotifier>().setIndex(0);
                        context.go('/home');
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
