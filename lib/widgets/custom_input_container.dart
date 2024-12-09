import 'package:flutter/material.dart';

//widget for a custom container
class CustomInputContainer extends StatelessWidget {
  final String labelText;
  //final TextEditingController controller;
  final double? height;  // Optional height for the container

  const CustomInputContainer({
    super.key,
    required this.labelText,
    //required this.controller,
    this.height,  // Optional height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary), // Use secondary color from the theme
        //color: Theme.of(context).colorScheme.onPrimary,
        //border: Border.all(color: Colors.grey.withOpacity(0.3)),

        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.02), // Light shadow color
            offset: const Offset(0, 4), // Shadow position
            blurRadius: 8, // Shadow blur
            spreadRadius: 2, // Spread shadow a bit
          ),
        ],
      ),
      child: SizedBox(
        height: height,  // Ensure the height is applied here
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,  // Scroll vertically
          child: TextField(
            //controller: controller,
            maxLines: null,  // Allow the TextField to expand vertically
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
            ),
          ),
        ),
      ),
    );
  }
}