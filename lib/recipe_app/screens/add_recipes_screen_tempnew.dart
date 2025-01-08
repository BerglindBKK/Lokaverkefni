import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';
import 'package:lokaverkefni/widgets/custom_input_container.dart'; // Import custom input container

class AddRecipesScreen extends StatefulWidget {
  const AddRecipesScreen({
    super.key,
    required this.onBack,
    required this.onAddRecipe,
  });

  final void Function(Recipe recipe) onAddRecipe;
  final VoidCallback onBack;

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
  final _photoUrlController = TextEditingController();
  Category _selectedCategory = Category.dessert; // Default category

  void _submitRecipeData() {
    if (_titleController.text.trim().isEmpty ||
        _ingredientsController.text.trim().isEmpty ||
        _instructionsController.text.trim().isEmpty ||
        _photoUrlController.text.trim().isEmpty) {
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

    Recipe newRecipe = Recipe(
      title: _titleController.text,
      ingredients: _ingredientsController.text,
      instructions: _instructionsController.text,
      category: _selectedCategory,
      cookingTime: _cookingTimeController.text.isEmpty
          ? 'Unknown'
          : _cookingTimeController.text,
      photoUrl: _photoUrlController.text,
    );

    widget.onAddRecipe(newRecipe);
    widget.onBack(); // Navigate back to the previous screen
  }

  @override
  void dispose() {
    _titleController.dispose();
    _ingredientsController.dispose();
    _instructionsController.dispose();
    _cookingTimeController.dispose();
    _photoUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Photo Section (top part of the screen)
          Column(
            children: [
              _photoUrlController.text.isNotEmpty
                  ? ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                ),
                child: Image.network(
                  _photoUrlController.text,
                  width: double.infinity,
                  height: 250, // Adjust the height of the photo
                  fit: BoxFit.cover,
                ),
              )
                  : ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                ),
                child: Image.asset(
                  'assets/images/raekjur.jpg', // Default image if no URL is provided
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),

              // Recipe Form Section (below the photo)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50], // Light grey background for the form
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Title input field
                        CustomInputContainer(
                          labelText: 'Recipe Title',
                          controller: _titleController,
                          borderColor: Colors.grey[400]!, // Default border color
                        ),

                        // Cooking time and category dropdown in one row
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              // Cooking Time Input
                              Expanded(
                                child: CustomInputContainer(
                                  labelText: 'Cooking Time (min)',
                                  controller: _cookingTimeController,
                                  borderColor: Colors.grey[400]!, // Default border color
                                ),
                              ),
                              const SizedBox(width: 16),

                              // Category Dropdown
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey[400]!,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: DropdownButtonFormField<Category>(
                                    decoration: const InputDecoration(
                                      labelText: 'Category',
                                      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                                      border: InputBorder.none,
                                    ),
                                    value: _selectedCategory,
                                    onChanged: (Category? newValue) {
                                      setState(() {
                                        _selectedCategory = newValue!;
                                      });
                                    },
                                    items: Category.values.map((Category category) {
                                      return DropdownMenuItem<Category>(
                                        value: category,
                                        child: Text(category.name),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Ingredients input field
                        CustomInputContainer(
                          labelText: 'Ingredients',
                          controller: _ingredientsController,
                          height: 180,
                          borderColor: Colors.grey[400]!, // Default border color
                        ),

                        // Instructions input field
                        CustomInputContainer(
                          labelText: 'Instructions',
                          controller: _instructionsController,
                          height: 180,
                          borderColor: Colors.grey[400]!, // Default border color
                        ),

                        // Photo URL input field
                        CustomInputContainer(
                          labelText: 'Photo URL',
                          controller: _photoUrlController,
                          height: 50,
                          borderColor: Colors.grey[400]!, // Default border color
                        ),

                        // Save Button
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _submitRecipeData,
                          child: const Text('Save Recipe'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Floating action button at the top-left
          Positioned(
            top: 16,
            left: 4, // Ensure padding on the left side
            child: Opacity(
              opacity: 0.75, // Set the opacity for the entire button (0.0 to 1.0)
              child: FloatingActionButton(
                onPressed: () {
                  widget.onBack(); // Go back when pressed
                },
                backgroundColor: Colors.white,
                child: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
