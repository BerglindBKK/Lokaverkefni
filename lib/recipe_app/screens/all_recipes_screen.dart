import 'package:flutter/material.dart';
import 'package:lokaverkefni/widgets/recipes_list.dart';
import 'package:lokaverkefni/models/recipe.dart';
import 'package:lokaverkefni/recipe_app/recipe_app.dart';

class AllRecipesScreen extends StatelessWidget {
  final List<Recipe> recipes;
  final VoidCallback onBack;

  const AllRecipesScreen({
    super.key,
    required this.recipes,
    required this.onBack,
  });

  // Function to delete a recipe - virkar ekki ennþá
  void _deleteRecipe(Recipe recipe) {
    // todo
    print('Deleted recipe: ${recipe.title}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 48.0, left: 16),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Text(
                'All recipes',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: RecipesList(
        recipes: recipes,
        onDeleteRecipe: _deleteRecipe, // virkar ekki ennþá
      ),
    );
  }
}
