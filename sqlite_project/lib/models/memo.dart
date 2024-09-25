class Memo {
  int? no; // primary key : 클래스로 생성할 때는 기본적으로 Null을 가질 수 있게 한다.
  late String info; // 데이터

  // 처음 등록할 때는 no가 없기 때문에 nullable로 선언.

  Memo({this.no, required this.info});

  // Select한 결과 : Map
  Memo.from(Map<String, dynamic> map){
    this.no = map['no'] as int;
    this.info = map['info'] as String;
  }

  // 클래스가 가지고 있는 것을 그대로 Map으로 가져옴
  // QueryBuilder를 기반으로 정보를 넘길 경우 대비
  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'info': info,
    };
  }
}
