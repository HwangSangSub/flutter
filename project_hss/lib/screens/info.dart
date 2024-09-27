import 'package:flutter/material.dart';
import '../mapper/BoardDBHelper.dart';
import '../models/board.dart';
import 'package:provider/provider.dart';
import '../provider/loginProvider.dart';

class InfoPage extends StatefulWidget {
  final BoardDBHelper dbHelper = BoardDBHelper();

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late int bno;
  late Future<Board> _board;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arguments = ModalRoute.of(context)!.settings.arguments;

    if (arguments != null) {
      bno = arguments as int;
      _board = widget.dbHelper.getBoardInfo(bno);
    }
  }

  @override
  Widget build(BuildContext context) {
    String? userId = Provider.of<LoginProvider>(context, listen: false).loginId;
    if (userId == null) {
      userId = '';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 상세보기'),
      ),
      body: FutureBuilder(
          future: _board,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data found'));
            } else {
              var result = snapshot.data;
              return _boardContent(result as Board, userId as String);
            }
          }),
    );
  }

  Widget _boardContent(Board board, String userId) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${board.title}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${board.content}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: (userId == board.writer ? true : false),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/modify',
                            arguments: board.bno);
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        '수정',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Center(
                  child: ElevatedButton(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
