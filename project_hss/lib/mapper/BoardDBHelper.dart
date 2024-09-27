import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/board.dart';

class BoardDBHelper {
  static final BoardDBHelper _dbHelper = BoardDBHelper._init();

  BoardDBHelper._init() {}

  factory BoardDBHelper() {
    return _dbHelper;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();

    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'board.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE boards (
            bno INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            content TEXT NOT NULL,
            writer TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // 전체조회
  Future<List<Board>> getBoards() async {
    Database db = await database;
    List<Map<String, dynamic>> result =
        await db.query('boards', orderBy: 'bno');

    return List.generate(result.length, (index) {
      Map<String, dynamic> board = result[index];
      return Board.from(board);
    });
  }

  // 단건조회
  Future<Board> getBoardInfo(int bno) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'boards',
      where: 'bno = ?',
      whereArgs: [bno],
    );
    Map<String, dynamic> board = result.first;
    return Board.from(board);
  }

  // 등록
  Future<int> insertBoard(Board board) async {
    Database db = await database;
    return await db.insert('boards', board.toMap());
  }

  // 수정
  Future<int> updateBoard(Board board) async {
    Database db = await database;
    return await db.update('boards', board.toMap(),
        where: 'bno =?', whereArgs: [board.bno]);
  }

  // 삭제
  Future<int> deleteBoard(int bno) async {
    Database db = await database;
    return await db.delete('boards', where: 'bno =?', whereArgs: [bno]);
  }

  // 내글 조회하기
  Future<List<Board>> getMyBoards(String id) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query('boards',
        where: 'writer = ?', whereArgs: [id], orderBy: 'bno');

    return List.generate(result.length, (index) {
      Map<String, dynamic> board = result[index];
      return Board.from(board);
    });
  }
}
