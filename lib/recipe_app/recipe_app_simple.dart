import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Recipe App"),
          backgroundColor: Colors.yellowAccent, // AppBar with yellow color
          foregroundColor: Colors.black, // Text color on primary background
        ),
      ),
    );
  }
}
