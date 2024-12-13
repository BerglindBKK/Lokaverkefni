import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';
import 'package:lokaverkefni/widgets/recipe_card.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({
    super.key,
    required this.recipes,
  });

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.isEmpty ? 0 : recipes.length,  // Added check for empty list
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(recipes[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          //margin: EdgeInsets.symmetric(
          //  horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          //),
        ),
        child: RecipeCard(recipes[index]), // Display the recipe card
      ),
    );
  }
}
