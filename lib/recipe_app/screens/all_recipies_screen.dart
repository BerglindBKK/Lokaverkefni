import 'package:flutter/material.dart';
import 'package:lokaverkefni/widgets/recipes_list.dart';
import 'package:lokaverkefni/models/recipe.dart';

class AllRecipesScreen extends StatelessWidget {
  final VoidCallback onBack;
  final List<Recipe> recipes;

  const AllRecipesScreen({
    super.key,
    required this.onBack,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Recipes test'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: recipes.isEmpty
          ? const Center(child: Text('No recipes available. Add some!'))
          : RecipesList(recipes: recipes), // Ensure recipes is not null
    );
  }
}

