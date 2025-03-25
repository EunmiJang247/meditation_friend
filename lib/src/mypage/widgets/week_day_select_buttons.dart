import 'package:flutter/material.dart';
import 'package:meditation_friend_app/common/utils/kcolors.dart';

class WeekDaySelectButtons extends StatefulWidget {
  final Function(int) onChanged; // 선택된 비트마스크 값을 전달하는 콜백

  const WeekDaySelectButtons({Key? key, required this.onChanged})
    : super(key: key);

  @override
  _WeekDaySelectButtonsState createState() => _WeekDaySelectButtonsState();
}

class _WeekDaySelectButtonsState extends State<WeekDaySelectButtons> {
  int selectedDays = 0; // 비트마스크 (0000000)

  final List<String> days = ["월", "화", "수", "목", "금", "토", "일"];

  void toggleDay(int index) {
    setState(() {
      selectedDays ^= (1 << (6 - index)); // 해당 비트 토글
    });
    widget.onChanged(selectedDays); // 변경된 값 전달
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(days.length, (index) {
          bool isSelected = (selectedDays & (1 << (6 - index))) != 0;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ElevatedButton(
              onPressed: () => toggleDay(index),
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Kolors.kOrange : Colors.grey,
                foregroundColor: Colors.white,
              ),
              child: Text(days[index]),
            ),
          );
        }),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class WeekDaySelectButtons extends StatefulWidget {
//   final Function(int) onChanged; // 선택된 비트마스크 값을 전달하는 콜백

//   const WeekDaySelectButtons({Key? key, required this.onChanged})
//     : super(key: key);

//   @override
//   _WeekDaySelectButtonsState createState() => _WeekDaySelectButtonsState();
// }

// class _WeekDaySelectButtonsState extends State<WeekDaySelectButtons>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   int selectedDays = 0; // 비트마스크 (0000000)

//   final List<String> days = ["월", "화", "수", "목", "금", "토", "일"];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: days.length, vsync: this);
//   }

//   void toggleDay(int index) {
//     setState(() {
//       selectedDays ^= (1 << index); // 해당 비트 토글
//     });
//     widget.onChanged(selectedDays); // 변경된 값 전달
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 50,
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal, // 좌우 스크롤 가능
//             child: TabBar(
//               controller: _tabController,
//               isScrollable: true, // 스크롤 가능하도록 설정
//               indicatorColor: Colors.blue,
//               tabs: List.generate(days.length, (index) {
//                 bool isSelected = (selectedDays & (1 << index)) != 0;
//                 return GestureDetector(
//                   onTap: () => toggleDay(index),
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     decoration: BoxDecoration(
//                       color: isSelected ? Colors.blue : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Text(
//                       days[index],
//                       style: TextStyle(
//                         color: isSelected ? Colors.white : Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
