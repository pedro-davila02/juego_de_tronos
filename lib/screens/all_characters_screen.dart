import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/character_provider.dart';
import 'detail_screen.dart';

class AllCharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Todos los Personajes')),
      body: FutureBuilder(
        future: provider.loadAllCharacters(page: 1, pageSize: 50), // Carga inicial
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar personajes'));
          } else {
            return ListView.builder(
              itemCount: provider.allCharacters.length,
              itemBuilder: (context, index) {
                final character = provider.allCharacters[index];
                return ListTile(
                  title: Text(character.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(character: character),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}