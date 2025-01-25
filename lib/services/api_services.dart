import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  final String baseUrl = 'https://anapioficeandfire.com/api/characters';

  // Obtener un personaje aleatorio
  Future<Character?> getRandomCharacter() async {
    try {
      // Número de personaje aleatorio entre 1 y 1000
      final randomId = (1 +
              (1000 *
                  (new DateTime.now().millisecondsSinceEpoch % 1000) /
                  1000))
          .round();
      final response = await http.get(Uri.parse('$baseUrl/$randomId'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return Character.fromJson(jsonData);
      } else {
        print('Error al obtener el personaje: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Excepción al obtener el personaje: $e');
      return null;
    }
  }

  // Obtener una lista de personajes paginados
  Future<List<Character>> getCharacters(
      {int page = 1, int pageSize = 10}) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl?page=$page&pageSize=$pageSize'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List;
        return jsonData
            .map((character) => Character.fromJson(character))
            .toList();
      } else {
        print('Error al obtener personajes: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Excepción al obtener personajes: $e');
      return [];
    }
  }
}
