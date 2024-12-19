import 'package:flutter/material.dart';
import 'package:lokaverkefni/widgets/custom_input_container.dart';
import 'package:lokaverkefni/models/recipe.dart';

class NewRecipe extends StatefulWidget {
  const NewRecipe({
    super.key,
    required this.onBack,
    required this.title,
    required this.onAddRecipe
  });

  final void Function(Recipe recipe) onAddRecipe;
  final VoidCallback onBack;
  final String title;

  @override
  State<NewExpense> createState() {
    return _NewRecipeState();
  }
}

class _NewRecipeState extends State<NewRecipe> {
  final _titleController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();
  Category _selectedCategory = Category.dessert;


  widget.onAddRecipe(
    Recipe(
    title: _titleController.text,
    ingredients: _ingredientsController.text
    instructions: _instructionsController.text,
    category: _selectedCategory,
    ),
  );
  Navigator.pop(context);
}

  @override
  Widget build(BuildContext context) {
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

          CustomInputContainer(
            labelText: 'CookingTime',
            controller: cookingTimeController,
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
                  cookingTime: 'Unknown',
                  category: Category.dessert,
                );

                // todo bæta við uppskrift, kalla á funciton til að bæta við lista
              } else {
                // bæta við alert?
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Error'),
                    content: const Text('All fields must be filled out!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
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
}
