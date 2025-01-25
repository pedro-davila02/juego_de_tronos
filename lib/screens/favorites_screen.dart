import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';
import '../widgets/character_card.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoriteProvider>(context).favorites;

    return Scaffold(
      appBar: AppBar(title: Text('Favoritos')),
      body: favorites.isEmpty
          ? Center(child: Text('No hay personajes favoritos.'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return CharacterCard(character: favorites[index]);
              },
            ),
    );
  }
}
