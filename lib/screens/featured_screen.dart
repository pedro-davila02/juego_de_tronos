import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/character.dart';

class FeaturedScreen extends StatefulWidget {
  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  Character? _character;

  @override
  void initState() {
    super.initState();
    _fetchRandomCharacter();
  }

  void _fetchRandomCharacter() async {
    final character = await ApiService().getRandomCharacter();
    setState(() {
      _character = character;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personaje Destacado')),
      body: _character == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _character!.name.isNotEmpty
                        ? _character!.name
                        : 'Desconocido',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8),
                  Text(
                      'Cultura: ${_character!.culture.isNotEmpty ? _character!.culture : 'Desconocido'}'),
                  Text(
                      'Nacido: ${_character!.born.isNotEmpty ? _character!.born : 'Desconocido'}'),
                  SizedBox(height: 16),
                  Text('Alias:', style: TextStyle(fontWeight: FontWeight.bold)),
                  if (_character!.aliases.isNotEmpty)
                    for (var alias in _character!.aliases) Text('- $alias')
                  else
                    Text('Desconocido'),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchRandomCharacter,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
