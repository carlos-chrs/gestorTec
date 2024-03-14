import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;

  bool get authenticated => _token != null;
  // Método para actualizar el token
  void updateToken(String newToken) {
    _token = newToken;
    notifyListeners();
  }

  // Método para cerrar la sesión
  void logout() {
    _token = null;
    notifyListeners();
  }
}
