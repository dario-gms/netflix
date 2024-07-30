import 'package:flutter/material.dart';
import 'package:myapp/components/profile_tile.dart';

class ProfileSelectionScreen extends StatelessWidget {
  const ProfileSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Image.asset(
          'assets/netflix_logo.png',
          height: 40, // Ajustar conforme necessário
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0), // Espaço adicional para o ícone
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.white, size: 20.0), // Ícone menor sem contorno
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
                    crossAxisSpacing: 5.0, // Reduzido o espaço horizontal entre os itens
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1, // Ajuste a proporção das células
                    children: const [
                      ProfileTile(name: 'João', imageUrl: 'assets/profile1.png'),
                      ProfileTile(name: 'Parasita 1', imageUrl: 'assets/profile2.png'),
                      ProfileTile(name: 'Professor', imageUrl: 'assets/profile3.png'),
                      ProfileTile(name: 'Mãe', imageUrl: 'assets/profile4.png'),
                      ProfileTile(name: 'Vizinha', imageUrl: 'assets/profile5.png'),
                      // Add other profiles here
                    ],
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
