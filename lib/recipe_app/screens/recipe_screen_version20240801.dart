import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';

//Recipescreen widget, requires the Recipe class
//Displays the whole recipe, including a photo (a default photo if user did not select a photo)

class RecipeScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeScreen({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('Recipe Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Display Recipe Title
            Text(
              recipe.title ?? 'No Title',
            ),
            const SizedBox(height: 16),

            // Displays the users photo or a default photo if user does not provide one
            recipe.photoUrl != null && recipe.photoUrl!.isNotEmpty
                ? Image.network(
              recipe.photoUrl!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            )
                //uses a default photo if user does not provide one
                : Image.asset(
              'assets/images/default_meat.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 16),

            // Displays cooking Time
            Row(
              children: [
                const Icon(Icons.timer, color: Colors.orange),
                const SizedBox(width: 8),
                Text('Cooking Time: ${recipe.cookingTime ?? 'Unknown'}'),
              ],
            ),
            const SizedBox(height: 16),

            // Displays recipe Ingredients
            Text(
              'Ingredients:',
            ),
            Text(recipe.ingredients ?? 'No ingredients'),
            const SizedBox(height: 16),

            // Display recipe instructions
            Text(
              'Instructions:',
            ),
            Text(recipe.instructions ?? 'No instructions'),
          ],
        ),
      ),
    );
  }
}
