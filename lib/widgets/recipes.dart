import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';
import 'package:lokaverkefni/widgets/recipes_list.dart';
import 'package:lokaverkefni/recipe_app/screens/add_recipes_screen.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() {
    return _RecipeState();
  }
}

class _RecipeState extends State<Recipes> {
  final List<Recipe> _registeredRecipes = [
    Recipe(
      title: 'Rice crispies cookies',
      ingredients: 'rice crispies, syrup',
      instructions: 'Mix and cool',
      cookingTime: '40 min',
      category: Category.dessert,
    ),
    Recipe(
      title: 'Pasta Bolognese',
      ingredients: 'Pasta, meat, tomato sauce',
      instructions: 'Cook pasta, prepare sauce',
      cookingTime: '30 min',
      category: Category.pasta,
    ),
  ];

  void _addRecipe(Recipe recipe) {
    setState(() {
      _registeredRecipes.add(recipe);
    });
  }

  void _deleteRecipe(Recipe recipe) {
    setState(() {
      _registeredRecipes.remove(recipe);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: _registeredRecipes.isEmpty
          ? const Center(child: Text('No recipes available.'))
          : RecipesList(
        recipes: _registeredRecipes,
        onDeleteRecipe: _deleteRecipe,  // Pass delete handler
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Add Recipe screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => AddRecipesScreen(
                onBack: () {
                  Navigator.pop(ctx);  // Go back to the previous screen
                },
                onAddRecipe: _addRecipe,
                title: 'Add Recipe',
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
