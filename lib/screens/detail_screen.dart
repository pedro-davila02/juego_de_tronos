import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/character.dart';
import '../providers/character_provider.dart';

class DetailScreen extends StatelessWidget {
  final Character character;

  DetailScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Column(
        children: [
          Text(character.name),
          Text(character.gender),
          Text(character.culture),
          ElevatedButton(
            onPressed: () {
              provider.addToFavorites(character);
            },
            child: Text('Añadir a Favoritos'),
          ),
        ],
      ),
    );
  }
}