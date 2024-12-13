import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';
import 'package:lokaverkefni/recipe_app/screens/all_recipies_screen.dart';
import 'package:lokaverkefni/widgets/recipes_list.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() {
    return _RecipeState();
  }
}

//final List<Recipe> recipes = [];

class _RecipeState extends State<Recipes> {
  final List<Recipe> _registeredRecipes = [
    Recipe(
      title: 'Rice crispies kökur',
      ingredients: 'rice crispies, syrup',
      instructions: 'mix and cool',
      cookingTime: '40min_recipes.dart',
      category: Category.dessert,
    ),
    Recipe(
      title: 'Rblabla',
      ingredients: 'sdfgsdf',
      instructions: 'sgfd',
      cookingTime: '10min',
      category: Category.dessert,
    ),
  ];

  List<Recipe> get registeredRecipes => _registeredRecipes;

  //void _addRecipe(Recipe recipe) {
  //  setState(() {
  //    _registeredRecipes.add(recipe);
  //    // Debugging line to check the list content after adding
  //    print('Updated recipes: $_registeredRecipes');
  //  });
  //}

  @override
  Widget build(BuildContext context) {
    // Check if the recipes list is empty
    Widget mainContent = const Center(
      child: Text('Engar uppskriftir'),
    );

    //if (_registeredRecipes.isNotEmpty)  {
      //mainContent = RecipesList(
        //recipes: _registeredRecipes,
      //);
      //mainContent = AllRecipesScreen(
        //onBack: () {
          // Handle back action here, e.g., navigate back
        //},
        //recipes: _registeredRecipes, // Pass the list of recipes
      //);
    //}

    return Scaffold(
      body: mainContent, // Display the content based on the check
    );
  }
}
