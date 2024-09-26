import 'package:flutter/material.dart';
import './screens/listScreen.dart' as listScreen;
import './screens/insertScreen.dart' as insertScreen;
import './screens/readScreen.dart' as readScreen;
import './screens/updateScreen.dart' as updateScreen;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memo Demo',
      initialRoute: '/memo/list',
      routes: {
        // 전체조회
        '/memo/list': (context) => listScreen.ListScreen(),
        // 단건조회
        '/memo/read':(context) => readScreen.ReadScreen(),
        // 등록
        '/memo/insert': (context) => insertScreen.InsertScreen(),
        // 수정
        '/memo/update': (context) => updateScreen.UpdateScreen(),
      },
    );
  }
}
