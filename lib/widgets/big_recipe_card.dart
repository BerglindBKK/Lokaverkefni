import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';
import 'package:lokaverkefni/colors.dart';

class BigRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const BigRecipeCard({required this.recipe, super.key});

  // Helper method to get category color
  Color _getCategoryColor(Category category) {
    switch (category) {
      case Category.meat:
        return AppColors.meat;
      case Category.fish:
        return AppColors.fish;
      case Category.pasta:
        return AppColors.pasta;
      case Category.salad:
        return AppColors.salad;
      case Category.dessert:
        return AppColors.dessert;
      default:
        return Colors.grey; // Default color if no category matches
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(48),
          topRight: Radius.circular(48),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display Recipe Title (font size 32, bold)
          Text(
            recipe.title ?? 'No Title',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Row with Cooking Time on the left and Category Dropdown on the right
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.timer, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text('Cooking Time: ${recipe.cookingTime ?? 'Unknown'}'),
                ],
              ),
              // Category dropdown with background color
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getCategoryColor(recipe.category),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_drop_down,
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
          const SizedBox(height: 16),

          // Title for Ingredients
          Text(
            'Ingredients:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(recipe.ingredients ?? 'No ingredients'),
          const SizedBox(height: 16),

          // Title for Instructions
          Text(
            'Instructions:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(recipe.instructions ?? 'No instructions'),
        ],
      ),
    );
  }
}
