import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'providers/favorite_provider.dart';

void main() {
  runApp(GameOfThronesApp());
}

class GameOfThronesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
        title: 'Game of Thrones Characters',
        theme: ThemeData(
          primarySwatch: Colors.indigo, // Color principal
          scaffoldBackgroundColor:
              Colors.indigo[50], // Fondo claro para las pantallas
          textTheme: TextTheme(
            headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            headlineMedium:
                TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 16),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo, // Color de los botones
              foregroundColor: Colors.white, // Color del texto en los botones
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Botones redondeados
              ),
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
