// lib/models/user.dart
class UserVO {
  String userId;
  String password;
  String nickname;
  String? email;

  UserVO()
      : userId = 'any',
        password = '1234',
        nickname = '익명';
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'password': password,
      'nickname': nickname,
      'email': email?? '',
    };
  }
}
