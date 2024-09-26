// lib/screens/insertScreen.dart
import 'package:flutter/material.dart';
import '../mappers/MemoDBHelper.dart' as MemoDBHelper;
import '../models/memo.dart' as memoModel;

class InsertScreen extends StatefulWidget {
  final MemoDBHelper.MemoDBHelper dbHelper = MemoDBHelper.MemoDBHelper();
  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  final TextEditingController _memoEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모 등록'),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // From 태그를 사용하면 From 태그를 사용해서 처리할 수 있음
              Form(
                key:
                    _formKey, // Key를 사용하는 이유는 모든 From 안에 validator를 확인해서 잘못된 입력시 사전에 막을 수 있다.
                child: TextFormField(
                  controller: _memoEditingController,
                  decoration: InputDecoration(
                    labelText: '메모',
                    helperText: '기록하고자 하는 메모',
                    border: OutlineInputBorder(),
                  ),
                  // 입력을 할때 submit로 값(value)을 땡길때 값을 체크할때 사용한다.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '입력한 메모가 없습니다.'; // 잘못 입력한 경우
                    }
                    return null; // 정상 입력한 경우
                  },
                  onChanged: (value) {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // 모든 항목에 정상적인 값 입력된 경우 (DB에 등록)
                        String info = _memoEditingController.text;
                        memoModel.Memo memo = memoModel.Memo(info: info);
                        int result = await widget.dbHelper.insertMemo(memo);
                        if (result > 0) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/memo/list', (route) => false);
                          // push되는 라우터 아래의 경로를 모두 제거 => 실상 새로고침
                        }
                      }
                    },
                    child: Text('등록'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // 이전 화면으로 이동
                    },
                    child: Text('취소'),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
