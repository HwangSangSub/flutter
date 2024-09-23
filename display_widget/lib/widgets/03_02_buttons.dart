import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

// 얘가 실제로 위젯을 렌더링하는 함수
class _ButtonPageState extends State<ButtonPage> {
  int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Name'),
        ),
        body: _getCurrentPage(),
        
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _curIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: _curIndex == 0 ? Colors.blue : Colors.black54,
              ),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.arrow_drop_down_circle,
                size: 30,
                color: _curIndex == 1 ? Colors.red : Colors.black54,
              ),
              label: "dropdown",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.print,
                size: 30,
                color: _curIndex == 2 ? Colors.green : Colors.black54,
              ),
              label: "floating",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.density_medium,
                size: 30,
                color: _curIndex == 3 ? Colors.orange : Colors.black54,
              ),
              label: "popup",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.ads_click,
                size: 30,
                color: _curIndex == 4 ? Colors.brown : Colors.black54,
              ),
              label: "icon",
            ),
          ],
        ));
  }

  // body에서 실행하기 때문에 이 위치에 들어가는게 좋다.
  // 페이지가 추가될때마다 여기에 넣는 방식이 좋다.
  Widget _getCurrentPage() {
    late Widget page;
    switch (_curIndex) {
      case 0:
        page = homePage();
        break;
      case 1:
        page = ButtonDemo('DropdownButton');
        break;
      case 2:
        page = ButtonDemo('FloatingActionButton');
        break;
      case 3:
        page = ButtonDemo('PopupMenuButton');
        break;
      case 4:
        page = ButtonDemo('IconButton');
        break;
    }
    return page;
  }
}

// 네비게이션 바 페이지 추가.
Container homePage() {
  return Container(
    alignment: Alignment.center,
    child: Text(
      'Home Page',
      style: TextStyle(fontSize: 30, color: Colors.amber),
    ),
  );
}

// ButtonDemo
class ButtonDemo extends StatefulWidget {
  late dynamic _buttonClass;

  ButtonDemo(String selected) {
    switch (selected) {
      case 'DropdownButton':
        _buttonClass = _dropdownButtonState();
        break;
      case 'FloatingActionButton':
        _buttonClass = _floatingActionButtonState();
        break;
      case 'PopupMenuButton':
        _buttonClass = _popupMenuButtonState();
        break;
      case 'IconButton':
        _buttonClass = _iconButtonState();
        break;
    }
  }

  @override
  State<ButtonDemo> createState() => _buttonClass;
}

// 1. DropdownButton
class _dropdownButtonState extends State<ButtonDemo> {
  String? _selectedValue = 'Apple';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton(
        value: _selectedValue, // 지금 현재 보여지는 데이터
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue;
          });
        },
        items: <String>[
          'Apple',
          'Banana',
          'Orange',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        // dropdown menu의 화살표 아이콘을 의미함
        icon: const Icon(Icons.arrow_downward),
        iconSize: 40,
        style: const TextStyle(color: Colors.blue, fontSize: 30),
      ),
    );
  }
}

// 2. FloatingACtionButton
class _floatingActionButtonState extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Press to button'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

// 3.PopupMenuButton
// 상당히 많이 사용되는 메뉴
enum RGB { red, green, blue }

class _popupMenuButtonState extends State<ButtonDemo> {
  RGB _currentColor = RGB.red;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<RGB>(
        // 사용자가 선택한 정보를 넘겨 받음
        onSelected: (RGB result) {
          setState(() {
            _currentColor = result;
          });
        },
        // 매개변수로 BuildContext를 받는다.
        itemBuilder: (BuildContext context) => <PopupMenuEntry<RGB>>[
          PopupMenuItem<RGB>(
            // enum 타입을 사용하는 방법은 타입(RGB)에 안에 값을 .으로 이어붙인다. > 예: RGB.red
            value: RGB.red,
            child: Text('Red'),
          ),
          PopupMenuItem<RGB>(
            value: RGB.green,
            child: Text('Green'),
          ),
          PopupMenuItem<RGB>(
            value: RGB.blue,
            child: Text('Blue'),
          ),
        ],
      ),
    );
  }
}

//4. IconButton
class _iconButtonState extends State<ButtonDemo> {
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.add_box),
            iconSize: 40,
            tooltip: 'Add 1', // 롱클릭 이벤트때 가능함.
            // 클릭을 했을 떄 무엇을 해줄지 설정
            onPressed: () {
              setState(() {
                _number++;
              });
            },
          ),
          Text(
            'Number: $_number',
          ),
        ],
      ),
    );
  }
}
