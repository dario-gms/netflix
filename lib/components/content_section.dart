import 'package:flutter/material.dart';
import 'package:myapp/components/content_tile_with_play_button.dart.dart';

class ContentSection extends StatelessWidget {
  final String sectionTitle;
  final List<String> contentList;

  const ContentSection({
    super.key,
    required this.sectionTitle,
    required this.contentList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            sectionTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ContentTileWithPlayButton(imageUrl: contentList[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
