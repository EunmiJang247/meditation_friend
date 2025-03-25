import 'package:meditation_friend_app/common/utils/kcolors.dart';
import 'package:meditation_friend_app/common/widgets/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:meditation_friend_app/src/mypage/widgets/time_select_widget.dart';
import 'package:meditation_friend_app/src/mypage/widgets/week_day_select_buttons.dart';

Future<dynamic> meditationAlramTimeBottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '알람 시간',
                style: appStyle(18.0, Kolors.kPrimary, FontWeight.bold),
              ),
              SizedBox(height: 10.h),

              // Information Section
              Text(
                '해당 시간에 알람을 드려요',
                textAlign: TextAlign.center,
                style: appStyle(16.0, Kolors.kDark, FontWeight.normal),
              ),
              SizedBox(height: 15.h),
              WeekDaySelectButtons(
                onChanged: (selectedDays) {
                  print(
                    "선택된 요일 비트마스크: ${selectedDays.toRadixString(2).padLeft(7, '0')}",
                  );
                },
              ),
              CustomTimePicker(
                // onTimeChanged: (selectedTime) {
                //   print("선택된 시간: ${selectedTime.hour}:${selectedTime.minute}");
                // },
              ),
            ],
          ),
        ),
      );
    },
  );
}
