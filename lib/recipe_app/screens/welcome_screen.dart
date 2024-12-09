
import 'package:flutter/material.dart';
import 'package:lokaverkefni/buttons/main_screen_button.dart';
import 'package:lokaverkefni/recipe_app/recipe_app.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.onNavigate});

  final void Function(String screen) onNavigate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Recipe App', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => onNavigate('all-recipes'),
            child: const Text('See All Recipes'),
          ),
          const SizedBox(height: 30),
          MainScreenButton(
            //answerText: answer,
            onTap: () {
              print('Main Screen Button clicked!');
          //answerQuestion(answer);
            },
            buttonText: 'Tap me!', // Pass the text here
          ),
          const SizedBox(height: 30),
          MainScreenButton(
            onTap: () => onNavigate('all-recipes'),
            buttonText: 'khjk',
          ),
            //buttonText: 'Tap me!', // Pass the text here
        ],
      ),
    );
  }
}
