// widgets/02_textfield.dart
// 입력하는 화면
import 'package:flutter/material.dart';

ListView textInputPage(BuildContext context) {
  TextEditingController editingController = TextEditingController();
  return ListView(
    children: [
      Text('You Can Input Text.'),
      // 입력하는 부분
      TextField(),
      SizedBox(
        height: 20,
      ),
      TextField(
        decoration: InputDecoration(
          labelText: 'Input Name',
          helperText: 'Korean language support',
        ),
        // onSubmitted: , // 실제로 사용자가 입력한 값을 불러올때
        onSubmitted: (value) {
          print('================================ result : $value');
        },
        // onChanged: , // 실시간으로 사용자가 입력한 값을 실시간으로 받아올때
      ),
      SizedBox(
        height: 20,
      ),
      TextField(
        controller: editingController,
        decoration: InputDecoration(
          labelText: 'Input Info',
        ),
      ),
      TextButton(
        onPressed: () {
          String value = editingController.text;
          print('Button : $value');
        },
        child: Text('확인'),
      ),
      // TextField(
      //   controller: editingController,
      // ),  
    ],
  );
}
