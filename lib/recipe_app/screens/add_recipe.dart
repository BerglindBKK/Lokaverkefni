import 'package:flutter/material.dart';
import 'package:lokaverkefni/widgets/custom_input_container.dart';

class AddRecipesScreen extends StatelessWidget {
  final VoidCallback onBack;
  final String title;

  const AddRecipesScreen({super.key, required this.onBack, required this.title});

  @override
  Widget build(BuildContext context) {
    // Create a TextEditingController to manage the title input
    //final TextEditingController titleController = TextEditingController();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //const Text('Add a recipe', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),

          //Title container
          const CustomInputContainer(
            labelText: 'Recipe Title',  // Custom label for this instance
            //controller: titleController,  // Pass the controller
          ),
          //

          //Ingredients
          const CustomInputContainer(
            labelText: 'Ingredients',  // Custom label for this instance
            //controller: ingredientsController,  // Pass the controller
            height: 200,
          ),
          //

          //Procedure
          const CustomInputContainer(
            labelText: 'Procedure', // Custom label for this instance
            //controller: procedureController,  // Pass the controller
            height: 200,
          ),

          //Save to file
          ElevatedButton(
            onPressed: onBack,
            child: const Text('Save'),
          ),

          //back to welcome screen
          ElevatedButton(
            onPressed: onBack,
            child: const Text('Back to Welcome Screen'),
          ),
        ],
      ),
    );
  }
}
