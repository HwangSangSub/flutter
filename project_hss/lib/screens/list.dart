import 'package:flutter/material.dart';
import '../mapper/BoardDBHelper.dart';
import '../models/board.dart';

class ListPage extends StatefulWidget {
  final BoardDBHelper dbHelper = BoardDBHelper();

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Board> _boardList = [];

  String? id;

  // 넘어온 값을 받는 부분
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments = ModalRoute.of(context)!.settings.arguments;

    print(arguments);
    if (arguments != null) {
      id = arguments as String;
      print(id);
    }
  }

  @override
  void initState() {
    super.initState();
    widget.dbHelper.getBoards().then((result) {
      setState(() {
        _boardList = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시판 목록'),
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _boardList.length,
        itemBuilder: (context, index) {
          Board board = _boardList[index];
          return ListTile(
            title: Text(board.title), // 게시판 제목 표시
            subtitle: Text(board.content), // 게시판 내용 표시
            onTap: () {
              // 게시판 클릭 시 동작 정의 가능
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/reg');
        },
        child: const Icon(Icons.create),
      ),
    );
  }
}
