import 'package:flutter/material.dart';
import '../mapper/MemberDBHelper.dart';
import '../models/member.dart';

class JoinPage extends StatefulWidget {
  final MemberDBHelper dbHelper = MemberDBHelper();
  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final TextEditingController _idEditingController = TextEditingController();
  final TextEditingController _pwdEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('회원 가입')),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _idEditingController,
                    decoration: InputDecoration(
                      labelText: '등록할 아이디',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 입력하세요.';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _pwdEditingController,
                    decoration: InputDecoration(
                      labelText: '등록할 비밀번호',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '아이디를 입력하세요.';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String id = _idEditingController.text;
                        String pwd = _pwdEditingController.text;

                        Member member = Member(id: id, pwd: pwd);

                        int result = await widget.dbHelper.insertMember(member);
                        print('result : ${result}');
                        if (result > 0) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/list', (route) => false,
                              arguments: id);
                        }
                      }
                    },
                    child: Text('회원가입')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('돌아가기')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
