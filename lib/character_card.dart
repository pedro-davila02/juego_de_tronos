import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        title: Text(
          character.name.isNotEmpty ? character.name : 'Desconocido',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
            'Alias: ${character.alias.isNotEmpty ? character.alias : 'Desconocido'}'),
      ),
    );
  }
}
