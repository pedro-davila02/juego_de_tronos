import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/api_services.dart';

class CharacterProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Character> _characters = [];
  List<Character> _favorites = [];
  List<Character> _allCharacters = [];
  Character? _randomCharacter;

  List<Character> get characters => _characters;
  List<Character> get favorites => _favorites;
  List<Character> get allCharacters => _allCharacters;
  Character? get randomCharacter => _randomCharacter;

  Future<void> loadCharacters(int page, int pageSize) async {
    _characters = await _apiService.fetchAllCharacters(page, pageSize);
    notifyListeners();
  }

  Future<void> loadAllCharacters({int page = 1, int pageSize = 50}) async {
    _allCharacters = await _apiService.fetchAllCharacters(page, pageSize);
    notifyListeners();
  }

  Future<void> loadRandomCharacter() async {
    _randomCharacter = await _apiService.fetchRandomCharacter();
    notifyListeners();
  }

  void addToFavorites(Character character) {
    if (!_favorites.contains(character)) {
      _favorites.add(character);
      notifyListeners();
    }
  }

  void removeFromFavorites(Character character) {
    _favorites.remove(character);
    notifyListeners();
  }
}