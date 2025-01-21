import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/character_provider.dart';

class FeaturedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CharacterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Destacado')),
      body: provider.randomCharacter == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(provider.randomCharacter!.name),
                  Text(provider.randomCharacter!.gender),
                  Text(provider.randomCharacter!.culture),
                ],
              ),
            ),
    );
  }
}