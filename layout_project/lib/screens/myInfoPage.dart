// lib/screens/myInfoPage.dart
import 'package:flutter/material.dart';
import './loginPage.dart' as login;
import '../models/user.dart' as uvo;

class MyInfoPage extends StatelessWidget {
  late uvo.UserVO myInfo;

  MyInfoPage({required this.myInfo});

  @override
  Widget build(BuildContext context) {
    //Scaffold로 뼈대는 만들어 주고 body에 SingleChildScrollView로 처리한다.
    return Scaffold(
      appBar: AppBar(
        title: Text('My Info Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Table(
              //공통된 레이아웃을 적용하고 싶을 경우
              border: TableBorder.all(),
              // 테이블 셀의 간격
              columnWidths: const {
                // 0: IntrinsicColumnWidth(), // IntrinsicColumnWidth: 자동 크기를 유지
                // 해당 세로 줄에 해당하는 칸들의 크기에 따라서 가로 길이를 설정
                0: FixedColumnWidth(100), // 100px
                // 특정 픽셀만큼을 가로 길이로 설정
                1: FlexColumnWidth(),
                // 나머지 세로 줄이 차지하고 남은 공간 전체를 가로 길이로 설정
              },
              children: [
                // for문 역시 1줄 명령만 가능하기 때문에 명령블록을 사용할 수 없다.
                for (var item
                    in myInfo.toMap().entries) // entries: key-value 타입을 반환하는 타입
                  getItemField(item.key, item.value)
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => login.LoginPage()
                  ),
                );
              },
              child: Text(
                'Close',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 코드가 반복되는것을 함수로 변환시켜서 쉽게 관리한다.
TableRow getItemField(String name, String? data) {
  return TableRow(
    children: [
      TableCell(
        child: Text(
          '$name',
          style: TextStyle(
            fontSize: 30, // 글자크기
            fontWeight: FontWeight.bold, // 글자굵기
          ),
          textAlign: TextAlign.center, // 정렬
          softWrap: true, // 자동 줄바꿈
        ),
      ),
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            '$data',
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    ],
  );
}
