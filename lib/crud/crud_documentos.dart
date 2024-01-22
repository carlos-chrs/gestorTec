import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCRUD {
  final SupabaseClient supabase;

  SupabaseCRUD({required this.supabase});

  // Insertar un documento
  Future<void> insertDocument(String table, Map<String, dynamic> data) async {
    final response = await supabase.from(table).insert(data);
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }

  // Obtener un documento

  // Actualizar un documento
  Future<void> updateDocument(
      String table, String id, Map<String, dynamic> data) async {
    final response = await supabase.from(table).update(data).eq('id', id);
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }

  // Eliminar un documento
  Future<void> deleteDocument(String table, String id) async {
    final response = await supabase.from(table).delete().eq('id', id);
    if (response.error != null) {
      throw Exception(response.error!.message);
    }
  }
}
