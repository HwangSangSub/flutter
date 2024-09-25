// lib/screens/readScreen.dart
import 'package:flutter/material.dart';
import '../mappers/MemoDBHelper.dart' as MemoDBHelper;
import '../models/memo.dart' as memoModel;

class ReadScreen extends StatefulWidget {
  final MemoDBHelper.MemoDBHelper dbHelper = MemoDBHelper.MemoDBHelper();
  @override
  // 무슨 위젯의 상태를 만드겠냐라는 의미로 정의
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  late int no;
  late Future<memoModel.Memo> _memo;

  // 넘어온 값을 받는 부분
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // context 는 initstate() 에서는 사용할 수 없다.
    final arguments = ModalRoute.of(context)!.settings.arguments;

    if (arguments != null) {
      // 값이 있다면 해당 값을 변수에 넣으면서 int로 변환한다.
      no = arguments as int;
      _memo = widget.dbHelper.getMemoInfo(no);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모 조회'),
      ),
      body: FutureBuilder(
        // Future가 완료되기 전에도 화면을 렌더링 할 수 있도록 (로딩화면-대기화면)
        future: _memo, // 반환 받을때 Future 그 자체를 받아온 이유.
        builder: (context, snapshot) {
          // snapshot: Future의 상태와 결과 등을 가진 객체
          if (snapshot.connectionState == ConnectionState.waiting) {
            // ConnectionState : Future의 상태 none -> waiting/active -> done
            return const Center(child: CircularProgressIndicator());
            // CircularProgressIndicator : 앱 진행사항을 원형으로 나타내는 위젯
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            // Future가 완료했으나 결과가 없을 때 (!)
            return const Center(child: Text('No data found'));
          } else {
            // 실제 화면에 렌더링될 위젯을 정의
            var result = snapshot.data;
            return _memoContent(result as memoModel.Memo);
          }
        },
      ), //
    );
  }

  Widget _memoContent(memoModel.Memo memo) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '번호: ${memo.no}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            '내용: ${memo.info}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
