import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginAunth {
  static const String _baseUrl = 'http://74.208.11.102:3000/api/v1';

  Future<String> login(String email, String password) async {
    final url = Uri.parse('$_baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final token = jsonResponse['accessToken'];
      return token;
    } else if (response.statusCode == 401) {
      throw Exception('Invalid password');
    } else if (response.statusCode == 404) {
      throw Exception('User not found');
    } else {
      throw Exception('Failed to login');
    }
  }
}
