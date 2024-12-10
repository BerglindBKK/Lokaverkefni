import 'package:flutter/material.dart';
import 'package:lokaverkefni/buttons/main_screen_button.dart';
import 'package:lokaverkefni/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.onNavigate});

  final void Function(String screen) onNavigate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //stack: for overlaying widgets on top of each other/overlay/first widget placed at the bottom (aftast)
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                //image: AssetImage('assets/images/recipe_app_landing.jpg'), // virkaði ekki
                image: NetworkImage('https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                fit: BoxFit.cover, // image covers the entire screen
              ),
            ),
          ),
          // Overlay content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Center the buttons horizontally
              children: [
                //Title
                const Text(
                  'Recipe App',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                //Button1
                SizedBox(
                  width: double.infinity,
                  child: MainScreenButton(
                    onTap: () => onNavigate('all-recipes'),
                    buttonText: 'All recipes',
                  ),
                ),
                const SizedBox(height: 10),
                //Button2
                SizedBox(
                  width: double.infinity,
                  child: MainScreenButton(
                    onTap: () => onNavigate('add-recipes'),
                    buttonText: 'Add a Recipe',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
