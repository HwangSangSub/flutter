// lib/widgets/07_pageView.dart
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
  final PageController _pageController = PageController(
    initialPage: 1, // 처음보여줄 페이지의 인덱스를 설정해주는 것
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Text는 출력하는 필드
          title: const Text('App Name'),
        ),
        body: PageView(
          controller: _pageController, // PageController를 PageView에 주입
          children: [firstPage(), secondPage()],
        ));
  }
}

ListView firstPage() {
  return ListView(
    children: [
      ListTile(
          title: const Text('ListView'),
          subtitle: const Text('Using ListTitle'),
          trailing: const Icon(Icons.more_vert),
          onTap: () {
            print('First');
          }),
      ListTile(
        leading: const FlutterLogo(size: 50.0),
        title: const Text('Flutter'),
        trailing: const Icon(Icons.autorenew),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(Icons.account_box, size: 50.0),
        title: const Text('Contacts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('Third'),
      ),
      ListTile(
          title: const Text('ListView'),
          subtitle: const Text('Using ListTitle'),
          trailing: const Icon(Icons.more_vert),
          onTap: () {
            print('First');
          }),
      ListTile(
        leading: const FlutterLogo(size: 50.0),
        title: const Text('Flutter'),
        trailing: const Icon(Icons.autorenew),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(Icons.account_box, size: 50.0),
        title: const Text('Contacts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('Third'),
      ),
      ListTile(
          title: const Text('ListView'),
          subtitle: const Text('Using ListTitle'),
          trailing: const Icon(Icons.more_vert),
          onTap: () {
            print('First');
          }),
      ListTile(
        leading: const FlutterLogo(size: 50.0),
        title: const Text('Flutter'),
        trailing: const Icon(Icons.autorenew),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(Icons.account_box, size: 50.0),
        title: const Text('Contacts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('Third'),
      ),
      ListTile(
          title: const Text('ListView'),
          subtitle: const Text('Using ListTitle'),
          trailing: const Icon(Icons.more_vert),
          onTap: () {
            print('First');
          }),
      ListTile(
        leading: const FlutterLogo(size: 50.0),
        title: const Text('Flutter'),
        trailing: const Icon(Icons.autorenew),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(Icons.account_box, size: 50.0),
        title: const Text('Contacts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('Third'),
      ),
      ListTile(
          title: const Text('ListView'),
          subtitle: const Text('Using ListTitle'),
          trailing: const Icon(Icons.more_vert),
          onTap: () {
            print('First');
          }),
      ListTile(
        leading: const FlutterLogo(size: 50.0),
        title: const Text('Flutter'),
        trailing: const Icon(Icons.autorenew),
        onTap: () => print('Second'),
      ),
      ListTile(
        leading: const Icon(Icons.account_box, size: 50.0),
        title: const Text('Contacts'),
        subtitle: const Text('Add Phone Number'),
        trailing: const Icon(Icons.add),
        onTap: () => print('Third'),
      ),
    ],
  );
}

GridView secondPage() {
  return GridView.count(
    crossAxisCount: 4, // 한 행에 배치할 위젯 수
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
