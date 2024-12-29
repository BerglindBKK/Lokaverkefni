import 'package:flutter/material.dart';
import 'package:lokaverkefni/widgets/recipes_list.dart';
import 'package:lokaverkefni/models/recipe.dart';

class AllRecipesScreen extends StatefulWidget {
  final List<Recipe> recipes;
  final VoidCallback onBack;

  const AllRecipesScreen({
    super.key,
    required this.recipes,
    required this.onBack,
  });

  @override
  State<AllRecipesScreen> createState() => _AllRecipesScreenState();
}

class _AllRecipesScreenState extends State<AllRecipesScreen> {
  String query = "";  // Store the search query

  // Function to delete a recipe
  void _deleteRecipe(Recipe recipe) {
    setState(() {
      widget.recipes.remove(recipe);  // Remove the recipe from the list
    });
    // SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${recipe.title} deleted'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Function to filter the recipes based on the query
  List<Recipe> _getFilteredRecipes(String query) {
    return widget.recipes
        .where((recipe) =>
    recipe.title.toLowerCase().contains(query.toLowerCase()) ||
        recipe.ingredients.toLowerCase().contains(query.toLowerCase())) // Filter by title or ingredients
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 48.0, left: 16),
          child: Row(
            children: [
              IconButton(
                onPressed: widget.onBack,
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Text(
                'All Recipes',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // SearchBar placed here
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (String newQuery) {
                setState(() {
                  query = newQuery;  // Update query as user types
                });
              },
              decoration: InputDecoration(
                hintText: 'Search recipes...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          // Recipes List that is filtered based on search query
          Expanded(
            child: RecipesList(
              recipes: _getFilteredRecipes(query),  // Use filtered recipes
              onDeleteRecipe: _deleteRecipe, // Pass delete handler
            ),
          ),
        ],
      ),
    );
  }
}
