import 'package:flutter/material.dart';
import '../mapper/MemberDBHelper.dart';
import '../models/member.dart';

class MyPage extends StatefulWidget {
  final MemberDBHelper dbHelper = MemberDBHelper();
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final TextEditingController _idEditingController = TextEditingController();
  final TextEditingController _pwdEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String id;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies;
    ModalRoute.of(context);
    // Navigator로 넘겨 받은 arguments를 담은 객체
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      id = arguments as String; // int로 casting

      widget.dbHelper.getMemberInfo(id).then((result) {
        _idEditingController.text = result.id;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('마이 페이지')),
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
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: ' 아이디',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _pwdEditingController,
                    decoration: InputDecoration(
                      labelText: '변경할 비밀번호',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '변경할 비밀번호를 입력하세요.';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String id = _idEditingController.text;
                      String pwd = _pwdEditingController.text;

                      Member member = Member(id: id, pwd: pwd);

                      int result = await widget.dbHelper.updateMember(member);
                      if (result > 0) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/list', (route) => false,
                            arguments: id);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    '수정',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
          ],
        ),
      ),
    );
  }
}
