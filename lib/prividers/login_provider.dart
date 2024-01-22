import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  void login(bool value) {
    _isLogin = value;
    notifyListeners();
  }
}
