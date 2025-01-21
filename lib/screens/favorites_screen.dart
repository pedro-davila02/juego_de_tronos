import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/character_provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Favoritos')),
      body: ListView.builder(
        itemCount: provider.favorites.length,
        itemBuilder: (context, index) {
          final character = provider.favorites[index];
          return ListTile(
            title: Text(character.name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                provider.removeFromFavorites(character);
              },
            ),
          );
        },
      ),
    );
  }
}