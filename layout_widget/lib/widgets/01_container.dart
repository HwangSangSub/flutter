// lib/widgets/01_container.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 화면에 위젯을 렌더링하는 함수
    return MaterialApp(
        title: 'Flutter Demo App',
        // home이 진짜 display에 출력되는 부분
        home: MyHomePage());
  }
}

// 여기까지는 공통 코드

// 여기서부터 적용되는 위젯에 따라 수정

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Text는 출력하는 필드
          title: const Text('App Name'),
        ),
        // Container는 위젯을 감싸는 위젯이다.
        // 자식의 영역만큼 가진다
        body: Container(
          padding: const EdgeInsets.all(80.0),
          margin: const EdgeInsets.all(80.0),
          width: 300,
          height: 300,
          color: Colors.blue,
          child: const Text(
            'This is a Container Example',
            textAlign: TextAlign.center, // TextAlign.center로 center-aligned
            style: TextStyle(
              fontSize: 15.0
            ),
          ),
        ));
  }
}
