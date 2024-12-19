import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({required this.recipe, super.key});

  Color _getCategoryColor(Category category) {
    switch (category) {
      case Category.meat:
        return Colors.pink;
      case Category.fish:
        return Colors.green;
      case Category.pasta:
        return Colors.blue;
      case Category.salad:
        return Colors.orange;
      case Category.dessert:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

        /*
    dessert,
  appetizer,
  mainCourse,
  beverage,
  */

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, //  all available horizontal space
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe.title ?? 'No Title',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Row(
                children: [

                  Icon(
                    Icons.timer,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    ' ${recipe.cookingTime ?? 'Unknown'}',
                  ),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getCategoryColor(recipe.category),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          categoryIcons[recipe.category],
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          recipe.category.toString().split('.').last,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}