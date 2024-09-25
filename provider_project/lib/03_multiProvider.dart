// lib/03_multiProvider.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/counter.dart' as counterModel;
import './models/text.dart' as textModel;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // 여러개 Providers를 선언합니다.
      // 모든 Provider은 자식속성은 필수가 아니다.
      providers: [
        // Counter with ChangeNotifier
        ChangeNotifierProvider<counterModel.Counter>(
          create: (_) => counterModel.Counter(),
        ),
        // Text with ChangeNotifier
        ChangeNotifierProvider<textModel.Message>(
          create: (_) => textModel.Message(),
        ),
      ],
      child: MaterialApp(
        title: 'Fultter Demo',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiProvider Demo'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              '현재 메세지: ${Provider.of<textModel.Message>(context).msg}',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Text(
            '현재 숫자: ${context.watch<counterModel.Counter>().count}',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<counterModel.Counter>(context, listen: false)
              .incrementCount();
          context.read<textModel.Message>().changeMsg('Hello, Flutter!');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
