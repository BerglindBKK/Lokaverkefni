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
      //appBar: AppBar(title: Text(widget.title)),
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 48.0, left: 16),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),// Show the screen title in the AppBar
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
