import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/list.dart';
import './screens/login.dart';
import './screens/join.dart';
import './screens/reg.dart';
import './screens/info.dart';
import './screens/modify.dart';

main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<String>.value(
      value: 'Shared Data', // 공유 데이터
      child: MaterialApp(
        title: '커뮤니티 게시판',
        //home : FirstPage()
        initialRoute: '/list', // 처음 실행할 화면
        routes: {
          // Navigator를 활용해서 전환할 화면 등록
          '/list': (context) => ListPage(),
          '/login': (context) => LoginPage(),
          '/join': (context) => JoinPage(),
          // '/reg':(context) => RegPage(),
          // '/info': (context) => InfoPage(),
          // '/modify': (context) => ModifyPage(),
        },
      ),
    );
  }
}
