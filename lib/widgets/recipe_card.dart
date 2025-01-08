import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';
import 'package:lokaverkefni/recipe_app/screens/recipe_screen.dart';

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
  appetizer,
  beverage,
  */

  @override
  Widget build(BuildContext context) {
    // Default image mapping for each category
    String _getCategoryDefaultImage(Category category) {
      switch (category) {
        case Category.meat:
          return 'assets/images/default_meat.png';
        case Category.fish:
          return 'assets/images/default_fish.png';
        case Category.pasta:
          return 'assets/images/default_pasta.png';
        case Category.salad:
          return 'assets/images/default_salad.png';
        case Category.dessert:
          return 'assets/images/default_dessert.png';
        default:
          return 'assets/images/default_meat.png'; // Fallback default image
      }
    }

    return GestureDetector(
      onTap: () {
        // Navigate to RecipeDetailScreen when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeScreen(recipe: recipe),
          ),
        );
      },
      child: Container(
      width: double.infinity, //  all available horizontal space
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(  // Change from Column to Row for horizontal layout
              children: [
                // Left side: Photo of the recipe
                recipe.photoUrl != null && recipe.photoUrl!.isNotEmpty
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    recipe.photoUrl!,  // Display the URL image
                    width: 120,          // Set the width of the image
                    height: 120,         // Set the height of the image
                    fit: BoxFit.cover,   // Ensure the image fills the box without distortion
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);  // Display an error icon if image fails to load
                    },
                  ),
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    _getCategoryDefaultImage(recipe.category), // Display default image
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 16),  // Space between the photo and text content

                // Right side: Recipe details
                Expanded(
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
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                            decoration: BoxDecoration(
                              color: _getCategoryColor(recipe.category),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                /*Icon(
                                  categoryIcons[recipe.category],
                                  color: Colors.white,
                                  size: 16,
                                ),*/
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
              /* Edit button
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  onEdit(recipe);  // Trigger the onEdit callback when edit button is pressed
                },
              ),*/
            ],
          ),
        ),
      ),
      ),
    );
  }
}