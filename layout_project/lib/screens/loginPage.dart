// lib/screens/loginPage.dart
import 'package:flutter/material.dart';
import 'package:layout_project/main.dart';
import 'package:layout_project/screens/myInfoPage.dart';
import '../models/user.dart' as userModel;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // id 입력 필드를 위한 TextEditingController
  final TextEditingController _idEditingController = TextEditingController();
  // password 입력 필드를 위한 TextEditingController
  final TextEditingController _passwordEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 아이디를 입력받는 위젯
            TextField(
              controller: _idEditingController,
              decoration: InputDecoration(
                labelText: '아이디',
                labelStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // 비밀번호를 입력받는 위젯
            TextField(
              controller: _passwordEditingController,
              decoration: InputDecoration(
                labelText: '비밀번호',
                labelStyle: TextStyle(fontSize: 15),
                border: OutlineInputBorder(),
              ),
              obscureText: true, // 입력한 값을 암호화
            ),
            SizedBox(height: 16),
            // 로그인, 취소 각각을 처리하는 위젯
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      userModel.UserVO loginVO = userModel.UserVO()
                        ..userId = _idEditingController.text
                        ..password = _passwordEditingController.text;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (ctx) => MyInfoPage(myInfo: loginVO)),
                      );
                      // 사용자가 입력한 ID, PWD를 받아 로그인 처리
                      // String id = _idEditingController.text;
                      // String pwd = _passwordEditingController.text;
                      // print('ID: $id, PWD: $pwd');
                    },
                    child: Text('로그인')),
                // 취소를 누르면 입력한 값을 초기화 한다.
                TextButton(
                    onPressed: () {
                      _idEditingController.clear();
                      _passwordEditingController.clear();
                    },
                    child: Text('취소')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
