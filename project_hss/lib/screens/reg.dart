import 'package:flutter/material.dart';
import '../mapper/BoardDBHelper.dart';
import '../models/board.dart';
import 'package:provider/provider.dart';
import '../provider/loginProvider.dart';

class RegPage extends StatefulWidget {
  final BoardDBHelper dbHelper = BoardDBHelper();

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _contentEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? userId = Provider.of<LoginProvider>(context, listen: false).loginId;

    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 등록'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleEditingController,
                decoration: const InputDecoration(
                  labelText: '등록할 제목',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제목을 입력하세요.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Expanded(
                child: TextFormField(
                  controller: _contentEditingController,
                  keyboardType: TextInputType.multiline,
                  expands: true,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: '등록할 내용',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '내용을 입력하세요.';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (userId != null) {
                        if (_formKey.currentState!.validate()) {
                          String title = _titleEditingController.text;
                          String content = _contentEditingController.text;
                          Board board = Board(
                              title: title, content: content, writer: userId);
                          int result = await widget.dbHelper.insertBoard(board);

                          if (result > 0) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/list', (route) => false);
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.save),
                        SizedBox(width: 5),
                        Text(
                          '등록',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back),
                        SizedBox(width: 5),
                        Text(
                          '돌아가기',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
