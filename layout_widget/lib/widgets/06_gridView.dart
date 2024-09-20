// lib/widgets/06_gridView.dart
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
        body: secondPage());
  }
}

GridView secondPage() {
  return GridView.count(
    crossAxisCount: 4,// 한 행에 배치할 위젯 수
    crossAxisSpacing: 10, // 가로로 위젯 간격
    mainAxisSpacing: 50, // 세로로 위젯 간격
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.blue[100],
        alignment: Alignment.center,
        child: const Text('1'),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.blue[200],
        alignment: Alignment.center,
        child: const Text('2'),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.blue[300],
        alignment: Alignment.center,
        child: const Text('3'),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.blue[400],
        alignment: Alignment.center,
        child: const Text('4'),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.blue[500],
        alignment: Alignment.center,
        child: const Text('5'),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.blue[600],
        alignment: Alignment.center,
        child: const Text('6'),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.blue[700],
        alignment: Alignment.center,
        child: const Text('7'),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.blue[800],
        alignment: Alignment.center,
        child: const Text('8'),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        color: Colors.blue[900],
        alignment: Alignment.center,
        child: const Text('9'),
      ),
    ],
  );
}
