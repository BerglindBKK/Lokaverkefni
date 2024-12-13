//recipe data stored in "registered expenses" list
//two hardcoded dummy cases
import 'package:lokaverkefni/models/recipe.dart';

class RecipeData {
  static final List<Recipe> registeredRecipes = [
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
}
