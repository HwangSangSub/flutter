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
      home: CheckPage(),
    );
  }
}

class CheckPage extends StatefulWidget {
  @override
  State<CheckPage> createState() => _CheckPage();
}

class _CheckPage extends State<CheckPage> {
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
                label: "checkbox"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.arrow_right_alt,
                  size: 30,
                  color: _curIndex == 2 ? Colors.blue : Colors.black54,
                ),
                label: "swich"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.check_circle_outline,
                  size: 30,
                  color: _curIndex == 3 ? Colors.blue : Colors.black54,
                ),
                label: "radio"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.adjust,
                  size: 30,
                  color: _curIndex == 3 ? Colors.blue : Colors.black54,
                ),
                label: "radioListTotle"),
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
        page = CheckDemo('Checkbox');
        break;
      case 2:
        page = CheckDemo('Switch');
        break;
      case 3:
        page = CheckDemo('Radio');
        break;
      case 4:
        page = CheckDemo('RadoiListTitle');
        break;
    }
    return page;
  }
}

Container homePage() {
  return Container(
    alignment: Alignment.center,
    child: const Text(
      'Check Page',
      style: TextStyle(color: Colors.blue, fontSize: 30),
    ),
  );
}

class CheckDemo extends StatefulWidget {
  late dynamic _inputClass;

  CheckDemo(String selected) {
    switch (selected) {
      case 'Checkbox':
        _inputClass = _checkboxState();
        break;
      case 'Switch':
        _inputClass = _switchState();
        break;
      case 'Radio':
        _inputClass = _radioState();
        break;
      case 'RadoiListTitle':
        _inputClass = _radioListTitleState();
        break;
    }
  }

  @override
  State<CheckDemo> createState() => _inputClass;
}

// 1. Checkbox
class _checkboxState extends State<CheckDemo> {
  var _isChecked = false;
  var _isOk = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Checkbox(
          value: _isChecked,
          // 사용자가 선택한 값을 가져올때 사용함.
          onChanged: (value) {
            setState(() {
              _isChecked = value!; // ! : 널이 아닌 값이 들어갈것이라고 확정을 짓는다.
            });
          },
        ),
        // 텍스트랑 체크박스가 하나의 형태로 묶이기 때문에 줄 자체를 선택해도 체크박스가 선택이 된다.
        CheckboxListTile(
          title: Text('동의합니다'),
          value: _isOk,
          onChanged: (value) {
            setState(() {
              _isOk = value!; // ! : 널이 아닌 값이 들어갈것이라고 확정을 짓는다.
            });
          },
        ),
      ],
    );
  }
}

// 2. Switch
class _switchState extends State<CheckDemo> {
  var _isChecked = false;
  var _isOk = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: _isChecked,
          // 사용자가 선택한 값을 가져올때 사용함.
          onChanged: (value) {
            setState(() {
              _isChecked = value; // ! : 널이 아닌 값이 들어갈것이라고 확정을 짓는다.
            });
          },
        ),
        // 텍스트랑 체크박스가 하나의 형태로 묶이기 때문에 줄 자체를 선택해도 체크박스가 선택이 된다.
        SwitchListTile(
          title: Text('동의합니다'),
          value: _isOk,
          onChanged: (value) {
            setState(() {
              _isOk = value; // ! : 널이 아닌 값이 들어갈것이라고 확정을 짓는다.
            });
          },
        ),
      ],
    );
  }
}

// 3. Radio
enum Fruit { APPLE, BANANA }

class _radioState extends State<CheckDemo> {
  Fruit _fruit = Fruit.APPLE;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: const Text('사과'),
            leading: Radio(
              value: Fruit.APPLE, // 해당 라디오를 선택한 경우 가지는 값
              // 라디오 버튼이 서로 연결되어 있다는 의미의 속성이 필요함. : 서로 다른 라디오 버튼이 GroupValue를 통해 하나의 그룹으로 설정한다.
              groupValue: _fruit,
              onChanged: (value) {
                setState(() {
                  _fruit = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('바나나'),
            leading: Radio(
              value: Fruit.BANANA, // 해당 라디오를 선택한 경우 가지는 값
              // 라디오 버튼이 서로 연결되어 있다는 의미의 속성이 필요함. : 서로 다른 라디오 버튼이 GroupValue를 통해 하나의 그룹으로 설정한다.
              groupValue: _fruit,
              onChanged: (value) {
                setState(() {
                  _fruit = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 4. RadoiListTitle > 3번과 동일한 내용인데 RadioListTile()를 이용하여 처리해본다.
class _radioListTitleState extends State<CheckDemo> {
  Fruit _fruit = Fruit.APPLE;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RadioListTile(
            title: Text('사과'),
            value: Fruit.APPLE,
            groupValue: _fruit,
            onChanged: (value){
              setState(() {
                _fruit = value!;
              });
            },
          ),
          RadioListTile(
            title: Text('바나나'),
            value: Fruit.BANANA,
            groupValue: _fruit,
            onChanged: (value){
              setState(() {
                _fruit = value!;
              });
            },),
        ],
      ),
    );
  }
}
