import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/common/widgets/reusable_text.dart';

class GradientBtn extends StatelessWidget {
  const GradientBtn({
    super.key,
    this.onTap,
    this.btnWidth,
    required this.text,
    this.btnHieght,
    this.textSize,
    this.borderColor,
    this.radius,
    this.btnColor,
  });

  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHieght;
  final double? radius;
  final String text;
  final double? textSize;
  final Color? borderColor;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // 배경 투명하게
      child: InkWell(
        onTap: onTap, // ✅ 눌렀을 때 동작
        borderRadius: BorderRadius.circular(radius ?? 30),
        child: Container(
          width: btnWidth ?? ScreenUtil().screenWidth / 2,
          height: btnHieght ?? 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 30),
            color: btnColor ?? Kolors.kOrange,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: ReusableText(
                text: text,
                style: appStyle(
                  textSize ?? 18,
                  borderColor ?? Kolors.kWhite,
                  FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
