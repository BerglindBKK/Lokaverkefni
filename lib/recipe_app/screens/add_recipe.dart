import 'package:flutter/material.dart';

class AddRecipesScreen extends StatelessWidget {
  const AddRecipesScreen({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Add a recipe', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onBack,
            child: const Text('Back to Welcome Screen'),
          ),
        ],
      ),
    );
  }
}
