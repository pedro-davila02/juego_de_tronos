import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  static const String baseUrl = 'https://anapioficeandfire.com/api/characters';

  // Obtener un personaje específico por ID
  Future<Character> fetchCharacterById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Character.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al cargar personaje');
    }
  }

  // Obtener todos los personajes (paginados por default)
  Future<List<Character>> fetchAllCharacters(int page, int pageSize) async {
    final response = await http.get(Uri.parse('$baseUrl?page=$page&pageSize=$pageSize'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar personajes');
    }
  }

  // Obtener un personaje aleatorio
  Future<Character> fetchRandomCharacter() async {
    final randomId = (DateTime.now().millisecond % 2000) + 1; // Ajusta según el rango de IDs
    return await fetchCharacterById(randomId);
  }
}