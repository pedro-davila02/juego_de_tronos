import 'package:flutter/material.dart';
import '../models/character.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Character> _favorites = [];

  List<Character> get favorites => _favorites;

  void toggleFavorite(Character character) {
    if (_favorites.contains(character)) {
      _favorites.remove(character);
    } else {
      _favorites.add(character);
    }
    notifyListeners();
  }

  bool isFavorite(Character character) => _favorites.contains(character);
}
