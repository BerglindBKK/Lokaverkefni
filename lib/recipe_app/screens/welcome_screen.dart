import 'package:flutter/material.dart';
import 'package:lokaverkefni/buttons/main_screen_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.onNavigate});

  final void Function(String screen) onNavigate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                //image: AssetImage('assets/images/recipe_app_landing.jpg'), // Your image path
                image: NetworkImage('https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                fit: BoxFit.cover, // Make the image cover the entire screen
              ),
            ),
          ),
          // Overlay content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Recipe App',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Ensure the text is readable
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => onNavigate('all-recipes'),
                  child: const Text(
                    'See All Recipes',
                    style: TextStyle(color: Colors.white), // Make button text white
                  ),
                ),
                const SizedBox(height: 10),
                MainScreenButton(
                  onTap: () => onNavigate('add-recipes'),
                  buttonText: 'Add a Recipe',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
