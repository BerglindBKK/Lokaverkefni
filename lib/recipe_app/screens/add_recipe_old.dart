import 'package:flutter/material.dart';
import 'package:lokaverkefni/widgets/custom_input_container.dart';
import 'package:lokaverkefni/models/recipe.dart';

class AddRecipesScreen extends StatelessWidget {
  final VoidCallback onBack;
  final String title;

  const AddRecipesScreen({
    super.key,
    required this.onBack,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    // Create TextEditingController for each input
    final TextEditingController titleController = TextEditingController();
    final TextEditingController ingredientsController = TextEditingController();
    final TextEditingController instructionsController = TextEditingController();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          // Title container with TextEditingController
          CustomInputContainer(
            labelText: 'Recipe Title',
            controller: titleController,
          ),

          // Ingredients
          CustomInputContainer(
            labelText: 'Ingredients',
            controller: ingredientsController,
            height: 200,
          ),

          // Procedure
          CustomInputContainer(
            labelText: 'Instructions',
            controller: instructionsController,
            height: 200,
          ),

          // Save button
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty && ingredientsController.text.isNotEmpty && instructionsController.text.isNotEmpty) {
                // Only add the recipe if all fields are filled
                final newRecipe = Recipe(
                  title: titleController.text,
                  ingredients: ingredientsController.text,
                  instructions: instructionsController.text,
                  cookingTime: 'Unknown',  // Placeholder, handle if needed
                  category: Category.dessert,  // Default, can be dynamic if needed
                );

                // Add the recipe (e.g., pass it back or to a function that handles the list)
                // You can call your method here to add the recipe to your list of recipes
              } else {
                // Optionally, show an alert if required fields are missing
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Error'),
                    content: const Text('All fields must be filled out!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);  // Close the dialog
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: const Text('Save'),
          ),

          // Back to welcome screen
          ElevatedButton(
            onPressed: onBack,
            child: const Text('Back to Welcome Screen'),
          ),
        ],
      ),
    );
  }

  AddRecipesScreen();
}
