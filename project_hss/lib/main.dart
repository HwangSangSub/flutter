import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/loginProvider.dart';

import './screens/list.dart';
import './screens/login.dart';
import './screens/join.dart';
import './screens/reg.dart';
import './screens/info.dart';
import './screens/modify.dart';
import './screens/myPage.dart';

main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: Main(),
    ),
  );
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<String>.value(
      value: 'Shared Data',
      child: MaterialApp(
        title: '커뮤니티 게시판',
        initialRoute: '/list',
        routes: {
          '/list': (context) => ListPage(),
          '/login': (context) => LoginPage(),
          '/join': (context) => JoinPage(),
          '/reg': (context) => RegPage(),
          '/info': (context) => InfoPage(),
          '/modify': (context) => ModifyPage(),
          '/myPage': (context) => MyPage(),
        },
      ),
    );
  }
}
