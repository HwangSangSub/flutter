// lib/statefulWidget.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // #1 : 최초로 MyApp을 실행
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // #2 : MaterialApp를 실행
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // #3 : homePage로 MyHomePage를 실행
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// StatefulWidgetState를 extends하는 클래스
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  // 변화를 감시할 수 있는 이유가 State객체를 사용할 수 있기 때문에
  // #4 : MyHomePageState를 실행
  State<MyHomePage> createState() => _MyHomePageState();
}

// 상태값을 저장하는 클래스
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // 변경된 상태를 확인하는 부분
  void _incrementCounter() {
    // setState()를 호출하여 상태값을 확인
    setState(() {
      _counter++; // 변경된 상태
    });
  }

  @override
  Widget build(BuildContext context) {
    // #5 : Scaffold widget안에 AppBar, Body, FloatingActionButton을 사용하며 실행
    return Scaffold(
      // 상단부분으로 타이틀 영역
      appBar: AppBar( // AppBar widget 사용
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center( // Center widget 사용
        // Center widget안에 Column, Row를 통해 여러가지 위젯을 배치할 수 있게 한다.
        child: Column( // Column widget 사용 : 여러개 widget을 가진다라는 의미로 사용하기 때문에 child를 작성.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // 해당부분은 텍스트보다 시안성이 좋은 아이콘을 배치하는 경우가 많다.
      floatingActionButton: FloatingActionButton( // FloatingActionButton widget 사용
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add), // Icon widget 사용 : add icon > 해당 부분은 크기가 작기 때문에 아이콘과 결합하여 많이 사용된다. 혹은 또다른 위젯을 넣어도 상관은 없다.
      ),
    );
  }
}
