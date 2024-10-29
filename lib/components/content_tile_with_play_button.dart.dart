import 'package:flutter/material.dart';

class ContentTileWithPlayButton extends StatelessWidget {
  final String imageUrl;

  const ContentTileWithPlayButton({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: 100,
            height: 150,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 0,
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.play_circle_outline, color: Colors.white, size: 70),
              onPressed: () {
                // Implementação futura para reprodução
              },
            ),
          ),
        ),
      ],
    );
  }
}
