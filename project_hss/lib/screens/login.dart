import 'package:flutter/material.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String id = _idEditingController.text;
                          String pwd = _pwdEditingController.text;

                          Member? _member =
                              await widget.dbHelper.login(id, pwd);

                          if (_member == null) {
                          } else {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/list', (route) => false,
                                arguments: id);
                          }
                        }
                      },
                      child: Text('로그인')),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/join');
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
        ));
  }
}
