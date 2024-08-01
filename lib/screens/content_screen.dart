import 'package:flutter/material.dart';
import 'package:myapp/components/content_tile.dart';
import 'package:myapp/models/users.dart';
import 'package:myapp/components/content_section.dart';

class ContentScreen extends StatelessWidget {
  final User user;

  const ContentScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/netflix_small_logo.png',
                  height: 40,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    // Implementação futura para pesquisa
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person, color: Colors.white),
                  onPressed: () {
                    // Implementação futura para perfil
                  },
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.black,
        centerTitle: false,
      ),
      body: ListView(
        children: [
          const ContentTile(
            title: 'THE SILENT SEA',
            imageUrl: 'assets/silent_sea.png',
            description: '',
            showTitleAndDescription: false,
            showPlayButtonOnly: false,
            showFullOverlay: true,
          ),
          const SizedBox(height: 10),
          ContentSection(
            sectionTitle: 'Continue watching for ${user.name}',
            contentList: const [
              'assets/dont_breathe.png',
              'assets/up.png',
              'assets/enders_game.png',
              'assets/fallout.png',
            ],
          ),
          const SizedBox(height: 10),
          const ContentSection(
            sectionTitle: 'Popular on Netflix',
            contentList: [
              'assets/spiderman.png',
              'assets/stranger_things.png',
              'assets/lost_in_space.png',
              'assets/black_mirror.png',
            ],
          ),
          const SizedBox(height: 10),
          const ContentSection(
            sectionTitle: 'Trending Now',
            contentList: [
              'assets/dont_look_up.png',
              'assets/the_crown.png',
              'assets/bridgerton.png',
              'assets/money_heist.png',
            ],
          ),
          // Adicione mais seções de conteúdo aqui
        ],
      ),
    );
  }
}


