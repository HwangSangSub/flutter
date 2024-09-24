// lib/02_DataTest.dart
import 'package:flutter/material.dart';

void main() => runApp(WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo App', home: FirstPage());
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
                  // 버튼을 클릭할 경우 새로운 위젯을 호출
                  var data = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        // 페이지를 생성할때 매개변수로 값을 넘긴다.
                          builder: (context) => SecondPage(data: '(request)')));
                  // 상태 변경 알림
                  setState(() => result = data);
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
