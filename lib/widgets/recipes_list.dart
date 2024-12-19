import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';
import 'package:lokaverkefni/widgets/recipe_card.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({
    super.key,
    required this.recipes,
    required this.onDeleteRecipe,  // Callback for deleting a recipe
  });

  final List<Recipe> recipes;
  final Function(Recipe) onDeleteRecipe;  // Callback for deleting recipe

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.isEmpty ? 1 : recipes.length, // Display placeholder if empty
      itemBuilder: (ctx, index) {
        if (recipes.isEmpty) {
          return const Center(child: Text('No recipes available.'));
        }

        return Dismissible(
          key: ValueKey(recipes[index].id), // Use unique ID for key
          onDismissed: (direction) {
            onDeleteRecipe(recipes[index]);  // Call delete function
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${recipes[index].title} deleted'),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          background: Container(
            color: Colors.red.withOpacity(0.75),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: RecipeCard(recipe: recipes[index]),  // Pass recipe to RecipeCard
        );
      },
    );
  }
}
