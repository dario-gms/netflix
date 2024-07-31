import 'package:flutter/material.dart';
import 'package:myapp/screens/content_screen.dart';
import 'package:myapp/components/users.dart';

class ProfileTile extends StatelessWidget {
  final User user;

  const ProfileTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContentScreen(user: user)),
        );
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(user.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            user.name,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
