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
      home: PickerPage(),
    );
  }
}

class PickerPage extends StatefulWidget {
  @override
  State<PickerPage> createState() => _PickerPage();
}

class _PickerPage extends State<PickerPage> {
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
                label: "date"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.arrow_right_alt,
                  size: 30,
                  color: _curIndex == 2 ? Colors.blue : Colors.black54,
                ),
                label: "time"),
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
        page = PickerDemo('Date');
        break;
      case 2:
        page = PickerDemo('Time');
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

class PickerDemo extends StatefulWidget {
  late dynamic _selelctedClass;

  PickerDemo(String selected) {
    switch (selected) {
      case 'Date':
        _selelctedClass = _datePickerState();
        break;
      case 'Time':
        _selelctedClass = _timePickerState();
        break;
    }
  }

  @override
  State<PickerDemo> createState() => _selelctedClass;
}

// 1. DatePicker(날짜)
class _datePickerState extends State<PickerDemo> {
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: const Text('Show DatePicker'),
          onPressed: () {
            // 비동기로 사용 : 사용자가 언제 사용할지 모르기 때문이다.
            Future<DateTime?> selectedDate = showDatePicker(
              // 즉각적으로 열수 있는 위젯은 아니고 Future를 통해 처리되는 위젯이다.
              context: context, // 내가 어느위치에 열리는지 값 받기
              initialDate: DateTime.tryParse('2024-12-31'), // 초기날짜를 지정하는 방식.
              firstDate: DateTime(1900), // 시작하는 년도
              lastDate: DateTime(2999), // 끝나는 년도
              // 이부분이 실행이 된다.
              // Future가 작동된다. > 사용자가 사용하는 부분을 가져와야한다. >
              builder: (context, child) {
                // 빌더는 위젯을 만들어주는 속성이라고 보면 된다.
                return Theme(
                  //data: ThemeData.dark(), // ThemeData 는 디자인부분이 있다
                  data: ThemeData.from(
                      colorScheme: ColorScheme.fromSeed(
                          seedColor: Colors
                              .blue)), // Dark()는 정해진 디자인, from을 통해 세부적인걸 처리할 수 있따.
                  child: child!,
                );
              },
            );
            selectedDate.then((date) {
              setState(() {
                _selectedDate = date;
              });
            });
          },
        ),
        // 배열 안에서는 For와 if-else 로도 작성할 수 있다.
        // 실행블록{} 을 지정할 수 없고 한줄로만 가능하다
        // 위젯 안 children 쪽에서 많이 사용된다.
        // if는 생성여부, for 생성갯수, 여러개 규칙을 처리할 때는 삼항연산자를 사용해서 처리한다.
        if (_selectedDate != null)
          Text(
              '${_selectedDate?.year}-${_selectedDate?.month}-${_selectedDate?.day}'),
      ],
    ));
  }
}

// 2. TimePicker (시간)
class _timePickerState extends State<PickerDemo> {
  TimeOfDay? _selectedTime;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: const Text('Show TimePicker'),
          onPressed: () {
            showTimePicker(
              context: context, // 내가 실행되어야할 위치
              initialTime: TimeOfDay.now(), // 초기시간
              // barrierColor: Colors.amber, // 배경컬러 : 디자인을 적용하기에는 작업량이 많음
              
            ).then((time) {
              setState(() {
                _selectedTime = time;
              });
            });
          },
        ),
        if (_selectedTime != null)
          Text('${_selectedTime?.hour}:${_selectedTime?.minute}'),
      ],
    ));
  }
}
