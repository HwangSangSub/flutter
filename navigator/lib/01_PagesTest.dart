// lib/01_PagesTest.dart
import 'package:flutter/material.dart';

void main() => runApp(WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo App', home: FirstPage());
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // context 위치에 대한 정보
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 버튼을 클릭할 경우 새로운 위젯을 호출
            Navigator.push(
              context, // 현재 위젯의 위치
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
          child: Text('Go to next Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          // 버튼을 클릭할 경우 현재 위젯을 제거
          onPressed: () => Navigator.pop(context), 
          child: Text('Go to previous Page'),
        ),
      ),
    );
  }
}
