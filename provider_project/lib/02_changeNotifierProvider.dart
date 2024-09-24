// 02_changeNotifierProvider.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/models/counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider(
        create: (_) => Counter(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('카운팅'),
        ),
        body: Center(
          //context.watch<Counter>() = Counter 객체
          child:
              Text('현재 숫자 : ${context.watch<Counter>().count}'), // watch : 출력
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              context.read<Counter>().incrementCount(), // read : 변경
          child: Icon(Icons.add),
        ));
  }
}
