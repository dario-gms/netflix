import 'dart:ui'; // Para o BackdropFilter

import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});

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
        children: const [
          ContentTile(
            title: 'THE SILENT SEA',
            imageUrl: 'assets/silent_sea.png',
            description: 'A post-apocalyptic thriller set on the moon.',
            showTitleAndDescription: false, // Não exibir título e descrição
            showPlayButtonOnly: false, // Exibir o botão de play com ícone
          ),
          ContentTile(
            title: 'Continue assistindo como João',
            imageUrl: 'assets/dont_breathe.png',
            description: 'Don\'t Breathe, Up, Ender\'s Game, Fallda.',
            showTitleAndDescription: true, // Exibir título e descrição
            showPlayButtonOnly: true, // Apenas o botão de play
            isRoundPlayButton: true, // Botão de play redondo e maior
          ),
          // Adicione mais tiles de conteúdo aqui
        ],
      ),
    );
  }
}

class ContentTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final bool showTitleAndDescription;
  final bool showPlayButtonOnly;
  final bool isRoundPlayButton; // Nova variável para botão de play redondo

  const ContentTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    this.showTitleAndDescription = true,
    this.showPlayButtonOnly = false,
    this.isRoundPlayButton = false, // Valor padrão falso
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          // Display only half of the image with blur
          ClipRect(
            child: Stack(
              children: [
                // Desfoque na imagem
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0), // Transparente para manter o desfoque
                    ),
                  ),
                ),
                // Imagem desfocada
                Align(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.5,
                  child: Image.asset(imageUrl, fit: BoxFit.cover),
                ),
              ],
            ),
          ),
          if (!showTitleAndDescription)
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8), // Espaço entre o título e os botões
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Minha Lista',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          onPressed: () {}, // Implementar funcionalidade de play
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            side: const BorderSide(color: Colors.white),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.play_arrow, color: Colors.black),
                              SizedBox(width: 4),
                              Text(
                                'Play',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {}, // Implementar funcionalidade de info
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            child: const Icon(Icons.info_outline, color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Info',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          if (showPlayButtonOnly)
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {}, // Implementar funcionalidade de play
                  style: ElevatedButton.styleFrom(
                    shape: isRoundPlayButton ? const CircleBorder() : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    side: const BorderSide(color: Colors.white),
                    padding: isRoundPlayButton ? const EdgeInsets.all(50) : const EdgeInsets.all(16), // Maior botão
                  ),
                  child: isRoundPlayButton
                      ? const Icon(Icons.play_arrow, color: Colors.white, size: 36) // Ícone maior
                      : const Text(
                          'Play',
                          style: TextStyle(color: Colors.black),
                        ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
