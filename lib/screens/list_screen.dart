import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/api_service.dart';
import 'detail_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final ApiService _apiService = ApiService();
  final ScrollController _scrollController = ScrollController();
  List<Character> _characters = [];
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchCharacters();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _fetchCharacters() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    final newCharacters =
        await _apiService.getCharacters(page: _page, pageSize: 10);
    setState(() {
      _isLoading = false;
      _characters.addAll(newCharacters);
      _hasMore = newCharacters.isNotEmpty;
      _page++;
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _fetchCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos los personajes')),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _characters.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _characters.length) {
            return const Center(child: CircularProgressIndicator());
          }
          final character = _characters[index];
          return ListTile(
            title: Text(
                character.name.isNotEmpty ? character.name : 'Desconocido'),
            subtitle: Text(
                'Alias: ${character.alias.isNotEmpty ? character.alias : 'Desconocido'}'),
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
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
