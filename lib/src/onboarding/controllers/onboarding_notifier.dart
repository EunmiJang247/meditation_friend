import 'package:flutter/material.dart';

class OnboardingNotifier with ChangeNotifier {
  // ChangeNotifier: Flutter에서 상태 변화를 감지하고 UI를 업데이트하는 기능을 제공하는 클래스
  // notifyListeners()를 호출하면 이 클래스를 사용하는 위젯이 자동으로 다시 그려짐.
  int _selectedPage = 0;
  int get selectedPage => _selectedPage;
  // 현재 선택된 페이지 인덱스를 가져오는 역할
  set setSelectedPage(int page) {
    // Setter: 새로운 페이지 인덱스를 설정하고 notifyListeners()를 호출하여 UI에 변경을 알림
    _selectedPage = page;
    notifyListeners();
    // notifyListeners()를 호출하면 이 클래스를 구독하고 있는 위젯들이 자동으로 업데이트됨.
  }
}
