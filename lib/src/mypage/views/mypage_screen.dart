import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/common/widgets/custom_button.dart';
import 'package:meditation_friend_app/common/widgets/reusable_text.dart';
import 'package:meditation_friend_app/src/mypage/widgets/tile_widget.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kSkyBlue,
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(radius: 50, backgroundColor: Kolors.kOffWhite),
          const SizedBox(height: 20),
          ReusableText(
            text: "nana@naver.com",
            style: appStyle(11, Kolors.kDark, FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              // color: Kolors.kOffWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ReusableText(
              text: "Andre DbesTech",
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
                  onTap: () {},
                ),
                ProfileTileWidget(
                  title: "선호하는 시간(duration)",
                  leading: MaterialIcons.access_time,
                  onTap: () {},
                ),
                ProfileTileWidget(
                  title: "명상 알림 시간 설정",
                  leading: MaterialIcons.lock_clock,
                  onTap: () {},
                ),
                ProfileTileWidget(
                  title: "선호하는 성별",
                  leading: Octicons.accessibility,
                  onTap: () {},
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
                print('로그아웃!');
              },
            ),
          ),
        ],
      ),
    );
  }
}
