import 'package:flutter/material.dart';
import 'package:myapp/screens/profile_screen.dart';

class NetflixLogoScreen extends StatefulWidget {
  const NetflixLogoScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NetflixLogoScreenState createState() => _NetflixLogoScreenState();
}

class _NetflixLogoScreenState extends State<NetflixLogoScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startFadeInAnimation();
    _navigateToNextScreen();
  }

  void _startFadeInAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileSelectionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 2),
              child: Image.asset('assets/netflix_logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
