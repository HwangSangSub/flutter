// lib/03_RouteTest.dart
import 'package:flutter/material.dart';

main() => runApp(WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo App',
        // home : FirstPage()
        initialRoute: '/page1', // 처음 실행할 화면
        // 사용될 화면을 이름과 함께 routes에 등록
        // Navigator을 활용해서 전환할 화면 등록
        routes: { 
          '/page1': (context) => FirstPage(),
          '/page2': (context) => SecondPage(data: '(request)'),
        });
  }   
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // 버튼을 클릭할 경우 새로운 위젯을 호출 : routes에 등록된 이름
                  var data = await Navigator.pushNamed(context, '/page2');
                  // 상태 변경 알림
                  setState(() {
                    result = data;
                  });
                },
                child: Text('Go to next Page'),
              ),
            ),
            Text('$result')
          ],
        ));
  }
}

class SecondPage extends StatelessWidget {
  final String data;

  SecondPage({required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ElevatedButton(
                  // 버튼을 클릭할 경우 현재 위젯을 제거
                  onPressed: () => Navigator.pop(context, '(result)'),
                  child: Text('Go to previous Page'),
                ),
              ),
              Text('$data')
            ]));
  }
}
