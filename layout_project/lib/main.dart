import 'package:flutter/material.dart';
import './screens/loginPage.dart' as login;
import './screens/myInfoPage.dart' as myInfo;
import './models/user.dart' as userModel;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Practice',
      home: login.LoginPage(), // 로그인 페이지
      //home: myInfo.MyInfoPage(), // 마이 페이지
    );
  }
}
