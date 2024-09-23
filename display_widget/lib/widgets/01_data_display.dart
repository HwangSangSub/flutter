// widgets/01_data_display.dart
import 'package:flutter/material.dart';

ListView dataDisplayPage() {
  //column은 이미지가 크거나 범위를 넘으면 처리르 못해주기 때문에 ListView를 작성
  return ListView(
    children: [
      // Text Widget : 가장 단순하고 많이 이용하는 위젯
      Text(
        'This is Text', // 출력하고자 하는 데이터
        style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          backgroundColor: Colors.black,
        ), // 출력하고 하는 데이터의 스타일
        textAlign: TextAlign.right,
      ),
      // Image Widget : Flutter에서 이미지를 로드하는 위젯
      // Image는 pubspec.yaml에 asset로 등록했기 때문에 이미지를 불러오는 건 Image.asset()를 사용
      Image.asset('images/cat_2.jpg'),
      // Icon Widget
      Icon(
        Icons.favorite,
        color: Colors.pink,
        size: 50,
      ),
      Icon(
        Icons.access_alarm,
        color: Colors.green,
        size: 50,
      )
    ],
  );
}
