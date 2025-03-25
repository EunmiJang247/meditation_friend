// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class TimePickerWidget extends StatefulWidget {
//   final Function(TimeOfDay) onTimeChanged; // 선택된 시간을 전달하는 콜백

//   const TimePickerWidget({Key? key, required this.onTimeChanged})
//     : super(key: key);

//   @override
//   _TimePickerWidgetState createState() => _TimePickerWidgetState();
// }

// class _TimePickerWidgetState extends State<TimePickerWidget> {
//   TimeOfDay selectedTime = TimeOfDay(hour: 12, minute: 0); // 기본 시간 (12:00)

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: CupertinoTimerPicker(
//         mode: CupertinoTimerPickerMode.hm, // 시, 분만 선택 가능
//         minuteInterval: 1, // 분 단위 선택
//         onTimerDurationChanged: (Duration duration) {
//           setState(() {
//             selectedTime = TimeOfDay(
//               hour: duration.inHours,
//               minute: duration.inMinutes.remainder(60),
//             );
//           });
//           widget.onTimeChanged(selectedTime); // 선택된 시간 전달
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class TimePickerWidget extends StatefulWidget {
//   const TimePickerWidget({Key? key}) : super(key: key);

//   @override
//   _TimePickerWidgetState createState() => _TimePickerWidgetState();
// }

// class _TimePickerWidgetState extends State<TimePickerWidget> {
//   TimeOfDay selectedTime = const TimeOfDay(hour: 12, minute: 0);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: Stack(
//         children: [
//           CupertinoTimerPicker(
//             mode: CupertinoTimerPickerMode.hm, // 시, 분 선택
//             minuteInterval: 1,
//             onTimerDurationChanged: (Duration duration) {
//               setState(() {
//                 selectedTime = TimeOfDay(
//                   hour: duration.inHours,
//                   minute: duration.inMinutes.remainder(60),
//                 );
//               });
//             },
//           ),
//           // "시" 텍스트 추가
//           Positioned(
//             left: MediaQuery.of(context).size.width * 0.38,
//             top: 85,
//             child: const Text("시", style: TextStyle(fontSize: 18)),
//           ),
//           // "분" 텍스트 추가
//           Positioned(
//             right: MediaQuery.of(context).size.width * 0.38,
//             top: 85,
//             child: const Text("분", style: TextStyle(fontSize: 18)),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({Key? key}) : super(key: key);

  @override
  _CustomTimePickerState createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  int selectedHour = 12; // 기본 시
  int selectedMinute = 30; // 기본 분

  final List<int> hours = List.generate(24, (index) => index); // 0~23 시간 리스트
  final List<int> minutes = List.generate(60, (index) => index); // 0~59 분 리스트

  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;

  @override
  void initState() {
    super.initState();
    // 시간과 분을 초기화한 후 컨트롤러에 설정
    _hourController = FixedExtentScrollController(initialItem: selectedHour);
    _minuteController = FixedExtentScrollController(
      initialItem: selectedMinute,
    );
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          '선택된 시간: $selectedHour 시 $selectedMinute 분',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 시 스크롤
            _buildWheelPicker(
              list: hours,
              controller: _hourController,
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedHour = index;
                });
              },
            ),
            const SizedBox(width: 4),
            const Text(
              "시", // "시" 텍스트
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 10),
            // 분 스크롤
            _buildWheelPicker(
              list: minutes,
              controller: _minuteController,
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedMinute = index;
                });
              },
            ),
            const SizedBox(width: 4),
            const Text(
              "분", // "분" 텍스트
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }

  // Wheel Picker를 만드는 함수
  Widget _buildWheelPicker({
    required List<int> list,
    required FixedExtentScrollController controller,
    required ValueChanged<int> onSelectedItemChanged,
  }) {
    return SizedBox(
      height: 120,
      width: 60,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 40,
        onSelectedItemChanged: onSelectedItemChanged,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Center(
              child: Text(
                list[index].toString(),
                style: const TextStyle(fontSize: 24),
              ),
            );
          },
          childCount: list.length,
        ),
      ),
    );
  }
}
