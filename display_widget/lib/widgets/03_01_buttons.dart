// widgets/03_01_buttons.dart

import 'package:flutter/material.dart';

Column buttonListOne() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      wrapButton(textButton()), // 1. TextButton
      wrapButton(outlineButton()), // 2. OuylinedButton
      wrapButton(elevatedButton()), // 3. ElevatedButton
      wrapButton(textButtonIcon()), // 4. TextButton
      overflowBar(), // 5. OverflowBar
    ],
  );
}

Padding wrapButton(Widget button) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: button,
  );
}

// 1. TextButton <- FlatButton
TextButton textButton() {
  return TextButton(
    onPressed: () {
      // 버튼을 클릭 : 필수
    },
    onLongPress: () {
      // 버튼을 길게 클릭
    },
    style: TextButton.styleFrom(
        // 버튼 배경색
        backgroundColor: Colors.lightBlue,
        // 텍스트 컬러
        foregroundColor: Colors.white),
    child: Text(
      'Text Button',
      style: TextStyle(
        fontSize: 20,
      ),
    ),
  );
}

// 2. OuylinedButton <- OutlineButton
OutlinedButton outlineButton() {
  return OutlinedButton(
    onPressed: () {
      // 버튼 한번 클릭 : 필수
    },
    onLongPress: (
        // 버튼 길게 클릭
        ) {},
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      side: BorderSide(
        color: Colors.lightBlue,
        width: 5.0,
        style: BorderStyle.solid,
      ),
    ),
    child: Text(
      'Outlined Button',
      style: TextStyle(
        fontSize: 20,
      ),
    ),
  );
}

// 3. ElevatedButton <- RaisedButton
ElevatedButton elevatedButton() {
  return ElevatedButton(
    onPressed: () {},
    onLongPress: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.lightBlue,
      foregroundColor: Colors.white,
      // 버튼에 적용하기 위한 높이(그림자영역)
      elevation: 20.0,
    ),
    child: Text(
      'Elevated Button',
      style: TextStyle(
        fontSize: 20,
      ),
    ),
  );
}

// 4.TextButton에 icon 넣기
TextButton textButtonIcon() {
  return TextButton.icon(
    // onPressed: () {

    // },
    onPressed:
        null, // 버튼을 비활성화 하는 경우 onPressed 속성에 null 값을 줌 (삼항연산자를 사용하면 특정한 값에 의해 활성화 비활성화를 처리할 수 있다.)
    label: Text('Go Home'),
    icon: Icon(
      Icons.home,
      size: 50.0,
    ),
    style: TextButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,

      // 비활성화 된 버튼의 색상을 바꿀때는 disabled 사용
      // withOpacity 투명도 넣기
      disabledBackgroundColor: Colors.pink.withOpacity(0.20),
      disabledForegroundColor: Colors.pink.withOpacity(0.20),
    ),
  );
}

// 5. OverflowBar : 화면에 끝정렬해서 버튼 나타나게 해 줌
OverflowBar overflowBar() {
  // 기본 정렬을 왼쪽으로부터 나옴
  return OverflowBar(
    alignment: MainAxisAlignment.center, // 자식들 전체 정렬방식
    spacing: 10, //
    overflowAlignment: OverflowBarAlignment.end, // 자식들의 정렬방식 : 가로를 넘어서는 순간
    overflowSpacing: 5, // 자식들 간의 간격
    children: [
      textButton(),
      outlineButton(),
    ],
  );
}
