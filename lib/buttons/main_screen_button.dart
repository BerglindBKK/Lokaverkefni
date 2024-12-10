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
        backgroundColor: colorScheme.primary.withOpacity(0.2), // 50% transparent
        foregroundColor: colorScheme.primary, // Button text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(
            color: colorScheme.primary, // Border color
            width: 1.0, // Fine border width
          ),
        ),
        elevation: 4.0, // Remove button shadow (if any)
      ),
      child: Text(
        buttonText, // Text passed from parent widget
        textAlign: TextAlign.center,
      ),
    );
  }
}
