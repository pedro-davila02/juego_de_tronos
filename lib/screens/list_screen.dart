import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/api_service.dart';
import '../widgets/character_card.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true; // Para saber si hay más datos por cargar
  List<Character> _characters = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchCharacters();

    // Escuchar el desplazamiento del ScrollController
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _hasMore) {
        _fetchCharacters();
      }
    });
  }

  Future<void> _fetchCharacters() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final characters =
          await ApiService().getCharacters(page: _page, pageSize: 10);

      setState(() {
        if (characters.isEmpty) {
          _hasMore = false; // No hay más datos por cargar
        } else {
          _characters.addAll(characters);
          _page++;
        }
      });
    } catch (e) {
      print('Error al cargar personajes: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController
        .dispose(); // Liberar el controlador al eliminar la pantalla
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Personajes')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _characters.length + (_hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < _characters.length) {
                  return CharacterCard(character: _characters[index]);
                } else {
                  // Mostrar un indicador de carga al final
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
          if (_isLoading && _characters.isEmpty)
            // Mostrar un indicador de carga inicial si aún no hay datos
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
