import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:meditation_friend_app/const/constants.dart';

class QuoteSlider extends StatelessWidget {
  const QuoteSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          SizedBox(
            height: 80,
            width: ScreenUtil().screenWidth,
            child: ImageSlideshow(
              indicatorBackgroundColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              onPageChanged: (page) {},
              autoPlayInterval: 5000,
              isLoop: true,
              children: List.generate(quotes.length, (i) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      top: 10.h,
                      bottom: 10.h,
                      left: 12.w,
                      right: 12.w,
                      child: SizedBox(
                        width: ScreenUtil().screenWidth - 20.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              quotes[i].quote,
                              style: appStyle(
                                14.sp,
                                Kolors.kDark,
                                FontWeight.normal,
                              ),
                              maxLines: 2, // 최대 2줄까지만 표시
                              overflow: TextOverflow.ellipsis, // 초과 시 ... 처리
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 4),
                            Text(
                              '- ${quotes[i].author}',
                              style: appStyle(
                                10.sp,
                                Kolors.kDark,
                                FontWeight.w500,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
