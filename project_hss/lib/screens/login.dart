import 'package:flutter/material.dart';
import 'package:project_hss/provider/loginProvider.dart';
import 'package:provider/provider.dart';
import '../models/member.dart';
import '../mapper/MemberDBHelper.dart';

class LoginPage extends StatefulWidget {
  final MemberDBHelper dbHelper = MemberDBHelper();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idEditingController = TextEditingController();
  final TextEditingController _pwdEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('로그인')),
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
                        labelText: '아이디',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '아이디를 입력하세요.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _pwdEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: '비밀번호',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '비밀번호를 입력하세요.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String id = _idEditingController.text;
                          String pwd = _pwdEditingController.text;

                          Member _member = await widget.dbHelper.login(id, pwd);

                          if (_member.id == '') {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext ctx) {
                                  return AlertDialog(
                                    title: Text('로그인 실패'),
                                    content: Text('아이디 또는 비밀번호가 일치하지 않습니다.'),
                                    actions: [
                                      TextButton(
                                        child: Text('확인'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: Text('취소'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            Provider.of<LoginProvider>(context, listen: false)
                                .login(id);
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/list', (route) => false);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        '로그인',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/join');
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        '회원가입',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        '돌아가기',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
