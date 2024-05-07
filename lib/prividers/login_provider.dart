import 'package:flutter/material.dart';
import 'package:web_app_tec/services/login_service.dart';
import 'package:web_app_tec/services/logout_service.dart';

class LoginProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;
  bool _loading = false;
  bool get authenticated => _token != null;

  bool get loading => _loading;
  // Método para actualizar el token
  void updateToken(String newToken) {
    _token = newToken;
    notifyListeners();
  }

  void updateloader(bool newState) {
    _loading = newState;
    notifyListeners();
  }

  Future<String?> login(String username, String password) async {
    String? newtoken;
    try {
      newtoken = await LoginAunth().login(username, password);
      updateToken(newtoken);
      notifyListeners();
      return newtoken;
    } catch (e) {
      return null;
    }
  }

  // Método para cerrar la sesión
  void logout() async {
    if (token != null) {
      String status = await LogOut().logOut(_token!);
      if (status == "success") {
        _token = null;
      }
      _token = null;
    }
    notifyListeners();
  }
}
