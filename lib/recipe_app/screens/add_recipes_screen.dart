import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';
import 'package:lokaverkefni/widgets/custom_input_container.dart';

class AddRecipesScreen extends StatefulWidget {
  const AddRecipesScreen({
    super.key,
    required this.onBack,
    required this.title,
    required this.onAddRecipe,
  });

  final void Function(Recipe recipe) onAddRecipe;
  final VoidCallback onBack;
  final String title;

  @override
  State<AddRecipesScreen> createState() {
    return _AddRecipesState();
  }
}

class _AddRecipesState extends State<AddRecipesScreen> {
  final _titleController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();
  final _cookingTimeController = TextEditingController();
  Category _selectedCategory = Category.dessert;

  // Function to submit the recipe data
  void _submitRecipeData() {
    if (_titleController.text.trim().isEmpty ||
        _ingredientsController.text.trim().isEmpty ||
        _instructionsController.text.trim().isEmpty) {
      // If any of the fields are empty, show an alert dialog
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error'),
          content: const Text('All fields must be filled out!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    // If all fields are filled, add the recipe
    widget.onAddRecipe(
      Recipe(
        title: _titleController.text,
        ingredients: _ingredientsController.text,
        instructions: _instructionsController.text,
        category: _selectedCategory,
        cookingTime: 'Unknown',  // Placeholder for cooking time
      ),
    );

    // Navigate back to the previous screen after adding the recipe
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _ingredientsController.dispose();
    _instructionsController.dispose();
    super.dispose();
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
                'Add recipes',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Title input field
            CustomInputContainer(
              labelText: 'Recipe Title',
              controller: _titleController,
            ),

            // Ingredients input field (larger height)
            CustomInputContainer(
              labelText: 'Ingredients',
              controller: _ingredientsController,
              height: 200,
            ),

            // Instructions input field (larger height)
            CustomInputContainer(
              labelText: 'Instructions',
              controller: _instructionsController,
              height: 200,
            ),

            // Row containing both cooking time and category dropdown
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: [
                  // Cooking Time Input with "min" inside the container
                  Expanded(
                    child: CustomInputContainer(
                      labelText: 'Cooking Time (min)',  // "min" is part of the label
                      controller: _cookingTimeController,
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Category Dropdown
                  Expanded(
                    child: DropdownButton<Category>(
                      value: _selectedCategory,
                      items: Category.values
                          .map(
                            (category) => DropdownMenuItem<Category>(
                          value: category,
                          child: Text(category.name), // Display the category name as is
                        ),
                      )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Save Button
            ElevatedButton(
              onPressed: _submitRecipeData,
              child: const Text('Save'),
            ),

            // Back Button to navigate to the previous screen
            ElevatedButton(
              onPressed: widget.onBack,
              child: const Text('Back to Recipes'),
            ),
          ],
        ),
      ),
    );
  }
}
