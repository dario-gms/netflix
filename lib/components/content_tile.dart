import 'package:flutter/material.dart';
import 'categories_dropdown.dart';

class ContentTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final bool showTitleAndDescription;
  final bool showPlayButtonOnly;
  final bool isRoundPlayButton;
  final bool showFullOverlay;

  const ContentTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    this.showTitleAndDescription = true,
    this.showPlayButtonOnly = false,
    this.isRoundPlayButton = false,
    this.showFullOverlay = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            if (showFullOverlay)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.white, size: 35,),
                              onPressed: () {},
                            ),
                            const Text(
                              'My List',
                              style: TextStyle(color: Colors.white, fontSize: 15), 
                            ),
                          ],
                        ),
                        const SizedBox(width: 50),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          label: const Text(
                            'Play',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 35),
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.info_outline, color: Colors.white, size: 35,),
                              onPressed: () {},
                            ),
                            const Text(
                              'Info',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (showFullOverlay)
              const Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('TV Shows', style: TextStyle(color: Colors.white, fontSize: 20)),
                    SizedBox(width: 20),
                    Text('Movies', style: TextStyle(color: Colors.white, fontSize: 20)),
                    SizedBox(width: 20),
                    CategoriesDropdown(), // Adicionando o Dropdown
                  ],
                ),
              ),
            if (showPlayButtonOnly)
              Positioned(
                bottom: 10,
                left: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.white,
                  ),
                  child: const Icon(Icons.play_arrow, color: Colors.black),
                  onPressed: () {},
                ),
              ),
          ],
        ),
        if (showTitleAndDescription)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
