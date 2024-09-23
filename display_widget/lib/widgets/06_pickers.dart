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

class _PickerPage extends State<PickerPage>{
  int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
      ),
      body: _getCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
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
              label: "home"
            ),
          BottomNavigationBarItem(
              icon: Icon(        
                Icons.iso,
                size: 30,
                color: _curIndex == 1 ? Colors.blue : Colors.black54,
              ),
              label: "date"
            ),
          BottomNavigationBarItem(
              icon: Icon(        
                Icons.arrow_right_alt,
                size: 30,
                color: _curIndex == 2 ? Colors.blue : Colors.black54,
              ),
              label: "time"
            ),           
         ]
      ),
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
  
  PickerDemo(String selected){
    switch(selected){
      case 'Date':
        _selelctedClass = _datePickerState();
        break;
      case 'Time' :
        _selelctedClass = _timePickerState();
        break;      
    }
  }

  @override
  State<PickerDemo> createState() => _selelctedClass;

}

// 1. DatePicker
class _datePickerState extends State<PickerDemo>{  
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Show DatePicker'),
                onPressed: () {},
              ),
              if (_selectedDate != null)
                Text('${_selectedDate?.year}-${_selectedDate?.month}-${_selectedDate?.day}'),
            ],
          ));
  }  
}

// 2. TimePicker
class _timePickerState extends State<PickerDemo>{  
  TimeOfDay? _selectedTime;
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Show TimePicker'),
                onPressed: () {},
              ),
              if (_selectedTime != null)
                Text('${_selectedTime?.hour}:${_selectedTime?.minute}'),
            ],
          ));
  }  
}
