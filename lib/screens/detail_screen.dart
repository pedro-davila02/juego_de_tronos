import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/character.dart';
import '../providers/favorite_provider.dart';

class DetailScreen extends StatelessWidget {
  final Character character;

  DetailScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(character);

    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(character.name,
                style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 8),
            Text('Cultura: ${character.culture}'),
            Text('Nacido: ${character.born}'),
            SizedBox(height: 16),
            Text('Alias:', style: TextStyle(fontWeight: FontWeight.bold)),
            for (var alias in character.aliases) Text('- $alias'),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                favoriteProvider.toggleFavorite(character);
              },
              child: Text(
                  isFavorite ? 'Eliminar de Favoritos' : 'Agregar a Favoritos'),
            ),
          ],
        ),
      ),
    );
  }
}
