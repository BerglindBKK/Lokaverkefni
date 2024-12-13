import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard(this.recipe, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipe.title ?? 'No Title',  // Fallback to 'No Title' if null
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text('Ingredients: ${recipe.ingredients ?? 'No ingredients available'}'),
            Text('Instructions: ${recipe.instructions ?? 'No instructions available'}'),
            Text('Cooking Time: ${recipe.cookingTime ?? 'Unknown'}'),
          ],
        ),
      ),
    );
  }
}
