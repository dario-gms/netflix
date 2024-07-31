import 'package:flutter/material.dart';
import 'package:myapp/components/content_tile.dart';
import 'package:myapp/components/users.dart';

class ContentScreen extends StatelessWidget {
  final User user;

  const ContentScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/netflix_small_logo.png',
              height: 40,
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Implementação futura para pesquisa
              },
            ),
          ),
        ],
        backgroundColor: Colors.black,
        centerTitle: false,
      ),
      body: ListView(
        children: [
          const ContentTile(
            title: 'THE SILENT SEA',
            imageUrl: 'assets/silent_sea.png',
            description: 'A post-apocalyptic thriller set on the moon.',
            showTitleAndDescription: true,
            showPlayButtonOnly: false,
          ),
          ContentTile(
            title: 'Continue assistindo como ${user.name}',
            imageUrl: 'assets/dont_breathe.png',
            description: 'Don\'t Breathe, Up, Ender\'s Game, Fallda.',
            showTitleAndDescription: true,
            showPlayButtonOnly: true,
            isRoundPlayButton: true,
          ),
          // Adicione mais tiles de conteúdo aqui
        ],
      ),
    );
  }
}
