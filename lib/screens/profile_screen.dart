import 'package:flutter/material.dart';
import 'package:myapp/components/profile_tile.dart';
import 'package:myapp/components/users.dart'; 
import 'content_screen.dart'; 

class ProfileSelectionScreen extends StatelessWidget {
  const ProfileSelectionScreen({super.key});

  void _onProfileTap(BuildContext context, User user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContentScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Image.asset(
          'assets/netflix_logo.png',
          height: 40,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0), 
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.white, size: 20.0), 
              onPressed: () {
                // Implementação futura para editar os perfis
              },
            ),
          ),
        ],
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int columns = constraints.maxWidth > 600 ? 5 : 2;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Quem está assistindo?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: columns,
                    crossAxisSpacing: 5.0, 
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1, 
                    children: users.map((user) {
                      return GestureDetector(
                        onTap: () => _onProfileTap(context, user),
                        child: ProfileTile(user: user),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
