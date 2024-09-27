import 'package:flutter/material.dart';
import '../mapper/MemberDBHelper.dart';
import '../mapper/BoardDBHelper.dart';
import '../models/member.dart';
import '../models/board.dart';
import 'package:provider/provider.dart';
import '../provider/loginProvider.dart';

class MyPage extends StatefulWidget {
  final MemberDBHelper dbHelper = MemberDBHelper();
  final BoardDBHelper dbBoardHelper = BoardDBHelper();
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with TickerProviderStateMixin {
  late TabController _tabController;
  List<Board> _boardList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
    String? userId = Provider.of<LoginProvider>(context, listen: false).loginId;
    widget.dbBoardHelper.getMyBoards(userId as String).then((result) {
      setState(() {
        _boardList = result;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('마이 페이지'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: "내정보 수정",
            ),
            Tab(
              text: "나의 글 보기",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Padding(
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

                            int result =
                                await widget.dbHelper.updateMember(member);
                            if (result > 0) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/list', (route) => false,
                                  arguments: id);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
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
          ),
          Center(
            child: ListView.builder(
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
                            onPressed: () {
                              widget.dbBoardHelper.deleteBoard(board.bno as int);
                              setState(() {
                                _boardList.removeAt(index);
                              });
                            },
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
          ),
        ],
      ),
    );
  }
}
