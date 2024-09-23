import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DialogPage(),
    );
  }
}

class DialogPage extends StatefulWidget {
  @override
  State<DialogPage> createState() => _DialogPage();
}

class _DialogPage extends State<DialogPage> {
  int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
      ),
      body: _getCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _curIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: _curIndex == 0 ? Colors.blue : Colors.black54,
                ),
                label: "home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.iso,
                  size: 30,
                  color: _curIndex == 1 ? Colors.blue : Colors.black54,
                ),
                label: "simple"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.arrow_right_alt,
                  size: 30,
                  color: _curIndex == 2 ? Colors.blue : Colors.black54,
                ),
                label: "alert"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.check_circle_outline,
                  size: 30,
                  color: _curIndex == 3 ? Colors.blue : Colors.black54,
                ),
                label: "show"),
          ]),
    );
  }

  Widget _getCurrentPage() {
    late Widget page;
    switch (_curIndex) {
      case 0:
        page = homePage();
        break;
      case 1:
        page = DialogDemo('Simple');
        break;
      case 2:
        page = DialogDemo('Alert');
        break;
      case 3:
        page = DialogDemo('Show');
        break;
    }
    return page;
  }
}

Container homePage() {
  return Container(
    alignment: Alignment.center,
    child: const Text(
      'Dialog Page',
      style: TextStyle(color: Colors.blue, fontSize: 30),
    ),
  );
}

class DialogDemo extends StatefulWidget {
  late dynamic _selelctedClass;

  DialogDemo(String selected) {
    switch (selected) {
      case 'Simple':
        _selelctedClass = _simpleDialogState();
        break;
      case 'Alert':
        _selelctedClass = _alertDialogState();
        break;
      case 'Show':
        _selelctedClass = _showDialogState();
        break;
    }
  }

  @override
  State<DialogDemo> createState() => _selelctedClass;
}

// 1. SimpleDialog : 지금 당신이 한 작업의 결과를 알려주거나 정보를 알려줌.
class _simpleDialogState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SimpleDialog(
        title: Text('SimpleDialog Title'),
        children: [
          Text("This is a simple dialog!"),
        ],
      ),
    );
  }
}

// 2. AlertDialog : 많이 사용하게될 대상이다.
class _alertDialogState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: const Text('AlertDialog Title'),
        // SingleChildScrollView 자기 부모의 중심축을 가지고 배치하는 방법.
        content: const SingleChildScrollView(
          child: ListBody(
            children: [
              Text("This is an alert dialog!"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
              Text("Do you want to continue?"),
            ],
          ),
        ), // simpleDialog(child)과는 다르게 내용부분을 content로 사용한다.
        actions: [
          // 응답을 하는 버튼 > 해당부분은 단순 display되는 건 사용하지 않는다.
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// 3. showdialog
class _showDialogState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
            onPressed: () => _dialogBuilder(context),
            child: const Text('show')));
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('ShowDialog Title'),
        content: Text('This is a show dialog!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          ),
        ],
      );
    },
  );
}
