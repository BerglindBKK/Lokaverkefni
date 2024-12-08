import 'package:flutter/material.dart';
import 'colors.dart';

class WelcomeScreen extends StatelessWidget {
  // Define the button style here
  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: customBlue, // Use the custom blue color from colors.dart
    foregroundColor: customWhite, // Use the custom white color from colors.dart
    padding: const EdgeInsets.symmetric(vertical: 16.0), // Padding inside the button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), // Rounded corners
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Screen'),
        backgroundColor: customGreen, // Set the AppBar background color to customGreen
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // Ensures horizontal stretching
          children: [
            const Center(
              child: Text(
                'What would you like to do?',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                style: elevatedButtonStyle, // Use the defined button style
                child: const Text(
                  'Add a recipe',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                style: elevatedButtonStyle, // Use the defined button style
                child: const Text(
                  'Search for a recipe',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                style: elevatedButtonStyle, // Use the defined button style
                child: const Text(
                  'Get a Random Recipe',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
