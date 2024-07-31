import 'package:flutter/material.dart';

class ContentTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final bool showTitleAndDescription;
  final bool showPlayButtonOnly;
  final bool isRoundPlayButton;

  const ContentTile({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    this.showTitleAndDescription = true,
    this.showPlayButtonOnly = false,
    this.isRoundPlayButton = false,
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
              height: 200,
            ),
            if (!showPlayButtonOnly)
              Positioned(
                bottom: 10,
                left: 10,
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      icon: Icon(
                        isRoundPlayButton ? Icons.play_circle_filled : Icons.play_arrow,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Play',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          icon: const Icon(Icons.add, color: Colors.black),
                          label: const Text(
                            'Minha Lista',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          icon: const Icon(Icons.info_outline, color: Colors.black),
                          label: const Text(
                            'Info',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
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
