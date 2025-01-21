import 'package:flutter/material.dart';
import 'featured_screen.dart';
import 'list_screen.dart';
import 'favorites_screen.dart';
import 'all_characters_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    FeaturedScreen(),        // Pantalla Destacado
    ListScreen(),            // Pantalla Listado
    FavoritesScreen(),       // Pantalla Favoritos
    AllCharactersScreen(),   // Pantalla Todos los Personajes
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Text('🏠'), label: 'Destacado'),
          BottomNavigationBarItem(icon: Text('📜'), label: 'Listado'),
          BottomNavigationBarItem(icon: Text('❤️'), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Text('📚'), label: 'Todos'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}