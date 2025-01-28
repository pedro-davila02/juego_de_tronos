import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/character.dart';
import '../providers/favorite_provider.dart';

class DetailScreen extends StatelessWidget {
  final Character character;

  const DetailScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name.isNotEmpty ? character.name : 'Desconocido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: ${character.name.isNotEmpty ? character.name : 'Desconocido'}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
                'Género: ${character.gender.isNotEmpty ? character.gender : 'Desconocido'}'),
            const SizedBox(height: 8),
            Text(
                'Cultura: ${character.culture.isNotEmpty ? character.culture : 'Desconocido'}'),
            const SizedBox(height: 8),
            Text(
                'Nacido: ${character.born.isNotEmpty ? character.born : 'Desconocido'}'),
            const SizedBox(height: 8),
            Text(
                'Alias: ${character.aliases.isNotEmpty ? character.aliases.join(", ") : 'Desconocido'}'),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                favoriteProvider.toggleFavorite(character);
                final snackBarMessage = favoriteProvider.isFavorite(character)
                    ? 'Añadido a favoritos'
                    : 'Eliminado de favoritos';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(snackBarMessage)),
                );
              },
              icon: Icon(
                favoriteProvider.isFavorite(character)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              label: Text(favoriteProvider.isFavorite(character)
                  ? 'Eliminar de favoritos'
                  : 'Añadir a favoritos'),
            ),
          ],
        ),
      ),
    );
  }
}
