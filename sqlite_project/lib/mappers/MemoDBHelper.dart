// lib/naooers/MemoDBHelper.dart
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/memo.dart';

class MemoDBHelper {
  // Mapper
  // DB접근은 싱글톤 패턴을 이용
  static final MemoDBHelper _dbHelper = MemoDBHelper._init();

  MemoDBHelper._init() {}

  //싱글톤일때 factory method로 DB 접근
  factory MemoDBHelper() {
    return _dbHelper;
  }

  // 실제 DB와 접속해서 처리하는 부분
  // 변수는 ? 에만 들어간다.
  Database? _database;

  // 앱이 실행되는 동안은 DB를 계속 열어둔다.
  // 리턴타입에 물음표가 들어가면 리턴이 널일수도 있다라는 의미이기때문에 조심해야한다.
  Future<Database> get database async {
    if (_database != null) return _database!; // DB가 연결된 상태면 DB를 반환

    _database = await initDatabase(); // 아니면 DB를 연결
    return _database!;
  }

  Future<Database> initDatabase() async {
    // join 함수 : path 라이브러리를 이용하여 DB 경로 구하기
    String path = join(await getDatabasesPath(), 'memo.db'); // DB 경로

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE memos(
            no INTEGER PRIMARY KEY AUTOINCREMENT,
            info TEXT
          )
        '''); // memos 테이블 생성
      },
    ); // DB를 연결
  }

  // 전체조회
  Future<List<Memo>> getMemos() async {
    Database db = await database;
    List<Map<String, dynamic>> result =
        await db.query('memos', orderBy: 'no'); // SELECT * FROM memos
    // 반복문을 통해서 List를 만들어 줌
    // List.generate : 버이있는거 말고 정확한 크기에 List를 만들어 준다.
    return List.generate(result.length, (index) {
      // index를 기반으로 어떤 값을 넣어줄지 해당 콜백함수에서 처리한다.
      Map<String, dynamic> memo = result[index]; // Map 하나하나가 쿼리의 결과의 Row와 같다.
      return Memo.from(memo);
    }); //List<Memo>
  }

  // 단건조회
  Future<Memo> getMemoInfo(int no) async {
    Database db = await database;
    // db.query : 조회를 할때 return 타입은 항상 List 이기 때문에 List<Map<String, dynamic>> 이어야 한다.
    List<Map<String, dynamic>> result = await db.query('memos',
        where: 'no =?', // where 조건
        whereArgs: [no] // where 조건에 ? 수 만큼 배열에 들어가야한다.
        ); // SELECT * FROM memos WHERE no = ?
    Map<String, dynamic> memo = result[0]; // Map 하나하나가 쿼리의 결과의 Row와 같다.
    return Memo.from(memo); // 1건만 조회 했기 때문에 List의 0번째 값을 리턴한다.
  }

  // 등록
  Future<int> insertMemo(Memo memo) async {
    Database db = await database;
    return await db.insert('memos', memo.toMap());
    // toMap() : {'no': memo.no, 'info': memo.info}); // Map<String, dynamic> 형태로 DB에 넣어준다.
  }

  // 수정
  Future<int> update(Memo memo) async {
    Database db = await database;
    return await db.update(
        'memos', // 테이블명
        memo.toMap(), // SET 절
        where: 'no =?', // 특정 항목에 대한 업데이트 시
        whereArgs: [memo.no] // where 조건에 값
        );
    /*
      // 위 update() 메소드의 실행문
      '''
        UPDATE $Table
        SET
        for(var column in columns.entries){
          $column.key = $column.value,
        }
        WHERE $where
      '''
    */
  }

  // 삭제
  Future<int> deleteMemo(int no) async {
    Database db = await database;
    return await db.delete('memos', where: 'no =?', whereArgs: [no]);
    // DELETE FROM memos WHERE no = ?
  }
}
