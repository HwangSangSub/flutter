import 'package:flutter/material.dart';

void main() => runApp(HelloWorld());
// 첫번째로 실행될 위젯 구현
// StatelessWidget 클래스 : 변화 없이 화면 표시만을 위한 위젯
class HelloWorld extends StatelessWidget {
  // build가 실제 실행될 기본적인 위젯을 반환
  @override
  Widget build(BuildContext context) {
    // MaterialApp 클래스
    // 안드로이드 머터리얼 디자인을 적용하기 위한 위젯
    return MaterialApp(
      // App 이름
      title: 'First Flutter App',
      home: Scaffold(
        appBar: AppBar(
          // 상단 바
          title: const Text('Hello World Demo'),
        ),
        body: const Center(
          // 화면 중앙
          child: const Text('Hello World'),
        ),
      )
    );
  }
}
