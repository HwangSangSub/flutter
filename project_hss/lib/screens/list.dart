import 'package:flutter/material.dart';
import '../mapper/BoardDBHelper.dart';
import '../models/board.dart';
import 'package:provider/provider.dart';
import '../provider/loginProvider.dart';

class ListPage extends StatefulWidget {
  final BoardDBHelper dbHelper = BoardDBHelper();

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Board> _boardList = [];

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
    String? userId = Provider.of<LoginProvider>(context).loginId;
    late bool _isVisible;
    if (userId != null) {
      _isVisible = true;
    } else {
      _isVisible = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 목록'),
        actions: [
          Visibility(
            visible: (userId != null ? false : true),
            child: IconButton(
              icon: const Icon(Icons.login),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
          Visibility(
            visible: (userId != null ? true : false),
            child: Center(
              child: PopupMenuButton<int>(
                onSelected: (result) {
                  switch (result) {
                    case 1:
                      Navigator.pushNamed(
                        context,
                        '/myPage',
                        arguments: userId,
                      );
                      break;
                    case 2:
                      Provider.of<LoginProvider>(context, listen: false)
                          .logout();
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text('마이페이지'),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text('로그아웃'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _boardList.length,
        itemBuilder: (context, index) {
          Board board = _boardList[index];
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${board.bno}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      board.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    board.writer,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(width: 10),
                  Visibility(
                    visible: (userId == board.writer ? true : false),
                    child: IconButton(
                      icon: Icon(Icons.delete_forever),
                      onPressed: () {},
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/info',
                        arguments: board.bno,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/reg');
          },
          child: const Icon(Icons.create),
        ),
      ),
    );
  }
}
