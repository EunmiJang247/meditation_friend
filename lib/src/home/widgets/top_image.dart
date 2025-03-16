import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/const/resource.dart';

class TopImage extends StatelessWidget {
  const TopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: ScreenUtil().screenWidth,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: -50,
            child: Image.asset(
              R.ASSETS_IMAGES_SPLASHSCREEN_PNG,
              height: 280,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 0,
            left: 50,
            child: Image.asset(
              R.ASSETS_IMAGES_SPLASHSCREEN_DOTDOT_PNG,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 100,
            left: 12,
            child: Text(
              'Namaste, \nJenny',
              style: appStyle(
                34,
                Kolors.kDark,
                FontWeight.bold,
              ).copyWith(height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
