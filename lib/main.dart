import 'package:flutter/material.dart';
import 'package:myapp/components/users.dart';
import 'package:myapp/screens/logo_screen.dart';
import 'package:myapp/screens/profile_screen.dart';
import 'package:myapp/screens/content_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const NetflixLogoScreen(),
        '/profiles': (context) => const ProfileSelectionScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/content') {
          final user = settings.arguments as User;
          return MaterialPageRoute(
            builder: (context) => ContentScreen(user: user),
          );
        }
        return null;
      },
    );
  }
}
