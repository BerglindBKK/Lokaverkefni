import 'package:flutter/material.dart';

class AllRecipesScreen extends StatelessWidget {
  const AllRecipesScreen({
    super.key,
    required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('All Recipes', style: TextStyle(fontSize: 24)),
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
