// lib/models/text.dart
import 'package:flutter/material.dart';

class Message with ChangeNotifier {
  String _msg = 'Hello!';

  String get msg => _msg;

  void changeMsg(msg) {
    this._msg = msg;

    notifyListeners();
  }
}
