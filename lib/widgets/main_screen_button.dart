import 'package:flutter/material.dart';

class MainScreenButton extends StatelessWidget {
  const MainScreenButton({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  final void Function() onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    // Access color scheme from the Theme file
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary, //withOpacity(0.2)transparent
        foregroundColor: colorScheme.surface, // Button text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(
            color: colorScheme.primary, // Border color
            width: 1.0, // Fine border width
          ),
        ),
        elevation: 8.0, // Remove button shadow (if any)
      ),
      child: Text(
        buttonText, // Text passed from parent widget
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18, // Set your desired font size here
          fontWeight: FontWeight.bold, // Optional: set font weight (if needed)
          shadows: [
            Shadow(
              offset: Offset(1.0, 1.0), // Position of the shadow (x, y)
              blurRadius: 3.0, // How much the shadow is blurred
              color: Color.fromARGB(50, 0, 0, 0), // Color of the shadow
            ),
          ],
        ),
      ),
    );
  }
}
