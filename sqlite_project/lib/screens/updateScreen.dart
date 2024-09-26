// lib/screens/updateScreen.dart
import 'package:flutter/material.dart';
import '../mappers/MemoDBHelper.dart' as MemoDBHelper;
import '../models/memo.dart' as memoModel;

class UpdateScreen extends StatefulWidget {
  final MemoDBHelper.MemoDBHelper dbHelper =
      MemoDBHelper.MemoDBHelper(); // DB 접속

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _memoEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // From 위젯에서만 사용하면 된다

  // 단건 조회를 우선을 해야함.
  late int no;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies;
    ModalRoute.of(context);
    // Navigator로 넘겨 받은 arguments를 담은 객체
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      no = arguments as int; // int로 casting

      widget.dbHelper.getMemoInfo(no).then((result) {
        _memoEditingController.text = result.info;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모 수정'),
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
                        memoModel.Memo memo =
                            memoModel.Memo(no: no, info: info);

                        int result = await widget.dbHelper.updateMemo(
                            memo); // 수정이 완료되기 전까지 대기를 걸어야 하기 때문에 await로 처리
                        if (result > 0) {
                          // 메인으로 돌아가는 역할 : 특정지점 까지 위치를 이동할때 사용하는 방식
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/memo/read', // 이동할 위치
                            ModalRoute.withName('/memo/list'), // 현재 있는 위치에서 쭉 내려가다가 withName에 맞는 라우터까지 도달할때 까지 이동하다가 위에 있는걸 모두 제거 : 적혀있는 페이지는 살려주고 그위에 페이지가 뜬다.
                            arguments: memo.no,
                          );
                        }
                      }
                    },
                    child: Text('수정'),
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
