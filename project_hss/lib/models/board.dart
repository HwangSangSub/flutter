class Board {
  int? bno;
  late String title;
  late String content;
  late String writer;

  Board({this.bno, required this.title, required this.content, required this.writer});

  Board.from(Map<String, dynamic> map) {
    this.bno = map['bno'] as int;
    this.title = map['title'] as String;
    this.content = map['content'] as String;
    this.writer = map['writer'] as String;
  }

  Map<String, dynamic> toMap() {
    return {
      'bno': bno,
      'title': title,
      'content': content,
      'writer': writer
    };
  }

}
