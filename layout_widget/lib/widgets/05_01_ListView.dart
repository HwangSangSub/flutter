// lib/common/05_01_ListView.dart
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
        body: ListView(
          children: [
            Container(
              height: 500.0,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text('RED'),
            ),
            Container(
              height: 500.0,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text('BLUE'),
            )
          ],
        ));
  }
}
