import 'dart:convert';
import 'package:http/http.dart' as http;

class LogOut {
  static const String _baseUrl = 'http://74.208.11.102:3000/api/v1';

  Future<String> logOut(String token) async {
    final url = Uri.parse('$_baseUrl/logout');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'accessToken': token}),
    );
    if (response.statusCode == 200) {
      return "success";
    } else if (response.statusCode == 500) {
      return "error";
    } else if (response.statusCode == 404) {
      return "sesion no activa";
    } else {
      return 'Failed to logout';
    }
  }
}
