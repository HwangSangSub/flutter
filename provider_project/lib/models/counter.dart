import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  // 공통으로 사용할 데이터를 필드로 설정
  int _count = 0;

  // 필요할 경우 getter로 접근
  int get count => _count;

  // 변경할 경우 해당 메소드 호출
  void incrementCount() {
    _count++;

    // Provider에게 전달
    notifyListeners();
  }
}
