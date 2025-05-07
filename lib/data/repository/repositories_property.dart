import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/models_property.dart';

class RealStateRepository {
  final String baseUrl;

  RealStateRepository({required this.baseUrl});

  Future<List<RealState>> fetchAll() async {
    final response = await http.get(Uri.parse('$baseUrl/realstates'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => RealState.fromJson(e)).toList();
    } else {
      throw Exception('Ma\'lumotlarni olishda xatolik yuz berdi.');
    }
  }

  Future<void> addRealState(RealState realState) async {
    final response = await http.post(
      Uri.parse('$baseUrl/realstates'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(realState.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Yangi mulkni qo\'shishda xatolik yuz berdi.');
    }
  }

  Future<void> deleteRealState(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/realstates/$id'));

    if (response.statusCode != 200) {
      throw Exception('Mulkni o\'chirishda xatolik yuz berdi.');
    }
  }

  Future<void> updateRealState(RealState realState) async {
    final response = await http.put(
      Uri.parse('$baseUrl/realstates/${realState.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(realState.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Mulkni yangilashda xatolik yuz berdi.');
    }
  }

  Future<RealState> fetchById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/realstates/$id'));

    if (response.statusCode == 200) {
      return RealState.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Mulk topilmadi.');
    }
  }
}
