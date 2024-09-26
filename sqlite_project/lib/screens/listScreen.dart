// lib/screens/listScreen.dart
/*
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  final MemoDBHelper.MemoDBHelper dbHelper = MemoDBHelper.MemoDBHelper();
  @override
  // 무슨 위젯의 상태를 만드겠냐라는 의미로 정의
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
 기본 틀
*/
import 'package:flutter/material.dart';
import '../mappers/MemoDBHelper.dart' as MemoDBHelper;
import '../models/memo.dart' as memoModel;

class ListScreen extends StatefulWidget {
  final MemoDBHelper.MemoDBHelper dbHelper = MemoDBHelper.MemoDBHelper();
  @override
  // 무슨 위젯의 상태를 만드겠냐라는 의미로 정의
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<memoModel.Memo> _memoList = [];
  @override
  void initState() {
    super.initState();
    // 초기화
    widget.dbHelper.getMemos().then((result) {
      // 화면을 업데이트하기 위해 state로 처리
      setState(() {
        _memoList = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('메모 목록')),
      body: ListView.builder(
        // 실제 리스트 크기만큼 item을 생성 : 테스트할때 몇개까지 출력되면 overflow가 일어나는지 할때도 사용
        itemCount: _memoList.length,
        // 정해진 갯수만큼 동일한 item을 기반으로 적용
        itemBuilder: (context, index) {
          memoModel.Memo memo = _memoList[index];
          return ListTile(
            leading: Text('${memo.no}'),
            title: Text('${memo.info}'),
            trailing: IconButton(
              onPressed: () async {
                // 개별 삭제
                int result = await widget.dbHelper.deleteMemo(memo.no as int);
                if (result > 0) {
                  // 삭제한게 한건이라도 있으면 OK
                  setState(() {
                    // _memoList.removeAt(index); // 어떤 index인지 정확하지 않으니 아래의 방법으로 처리한다.
                    _memoList.removeWhere((info) => info.no == memo.no); // 개별개별 값을 확인해서 해당하는거를 목록에서 지운다.
                  });
                }
              },
              icon: Icon(Icons.delete),
            ),
            onTap: () {
              // 선택
              Navigator.pushNamed(
                context,
                '/memo/read',
                arguments: memo.no, // 호출할때 넘어가는 값
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 등록 페이지로 전환
          Navigator.pushNamed(context, '/memo/insert');
        },
        child: Icon(Icons.create),
      ),
    );
  }
}
