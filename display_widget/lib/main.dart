import 'package:flutter/material.dart';
import './widgets/01_data_display.dart' as data_display;
import './widgets/02_textfield.dart' as text_field;
import './widgets/03_01_buttons.dart' as buttons;
import './widgets/03_02_buttons.dart' as buttons2;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Display Demo',
      // App에 전체적인 테마를 지정하기 위함. 전반적인 디자인 색상을 사용한다는 의미
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true),
      //home: MyHomePage(),
      home: buttons2.ButtonPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 얘가 실제로 위젯을 렌더링하는 함수
class _MyHomePageState extends State<MyHomePage> {
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
                Icons.article,
                size: 30,
                color: _curIndex == 1 ? Colors.red : Colors.black54,
              ),
              label: "datas",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mode_edit,
                size: 30,
                color: _curIndex == 2 ? Colors.green : Colors.black54,
              ),
              label: "textField",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 30,
                color: _curIndex == 3 ? Colors.deepOrange : Colors.black54,
              ),
              label: "buttons",
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
        page = data_display.dataDisplayPage();
        break;
      case 2:
        page = text_field.textInputPage(context);
        break;
      case 3:
        page = buttons.buttonListOne();
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
