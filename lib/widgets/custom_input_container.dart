import 'package:flutter/material.dart';

// This widget is a custom container for input fields (like TextFields) with a label, customizable height, and styling.
class CustomInputContainer extends StatelessWidget {
  final String labelText; // The label text to show inside the container (e.g., 'Recipe Title')
  final TextEditingController controller; // Controller to manage the text input
  final double? height; // Custom height of the container (optional)
  final bool readOnly; // Flag to make the input field read-only (optional, default is false)

  const CustomInputContainer({
    super.key,
    required this.labelText,  // The text that will be used as the label
    required this.controller, // The controller that controls the input field
    this.height,             // Optional: Custom height, if not provided it will default to 60
    this.readOnly = false,   // Optional: If true, the text field is read-only (default is false)
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // The container takes up the full width of the screen
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16), // Padding inside the container for proper spacing
      margin: const EdgeInsets.only(bottom: 16, right: 16, left: 16), // Margin around the container to give it space from others
      decoration: BoxDecoration(
        color: Colors.grey[50], // Light grey background color for the input container
        borderRadius: BorderRadius.circular(8), // Rounded corners for the container
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), // Light shadow for subtle depth
            offset: const Offset(0, 4), // Position of the shadow (x, y)
            blurRadius: 8, // How blurred the shadow is
            spreadRadius: 2, // How far the shadow spreads
          ),
        ],
      ),
      child: SizedBox(
        height: height ?? 60, // If height is provided, use it; otherwise, default to 60
        child: TextField(
          controller: controller, // The controller that manages text input
          readOnly: readOnly, // Determines if the text field is editable or not
          maxLines: null, // Allow multiple lines of text in the input field
          keyboardType: TextInputType.multiline, // Set the keyboard to multiline mode (for long text)
          decoration: InputDecoration(
            labelText: labelText, // The label to display inside the text field (e.g., 'Recipe Title')
            labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6), // Slightly faded label color for better visibility
            ),
            border: InputBorder.none, // Removes the default border of the text field to make it cleaner
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0), // Padding inside the text field for better spacing
          ),
        ),
      ),
    );
  }
}
