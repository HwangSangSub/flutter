// lib/common/05_02_ListTitle.dart
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
        body: firstPage());
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
      ),      ListTile(
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
      ),      ListTile(
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
      ),      ListTile(
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
      ),      ListTile(
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
