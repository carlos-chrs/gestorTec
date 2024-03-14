import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_app_tec/models/documento_model.dart';

class DocumentService {
  static const String _baseUrl = 'http://localhost:3000/api/v1/document/';

  static Future<List<DocumentModel>> getAllDocuments() async {
    final url = Uri.parse('$_baseUrl/get');
    final response = await http.get(url);
    // print("response: $response");
    if (response.statusCode == 200) {
      // Si la solicitud es exitosa, convierte la respuesta JSON en una lista de DocumentModel
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => DocumentModel.fromJson(e)).toList();
    } else {
      // Si la solicitud falla, lanza una excepción o maneja el error de alguna manera
      throw Exception('error al cargar documentos');
    }
  }
}
