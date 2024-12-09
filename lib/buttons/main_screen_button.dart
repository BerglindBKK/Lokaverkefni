import 'package:flutter/material.dart';

class MainScreenButton extends StatelessWidget {
  const MainScreenButton({
    super.key,
    required this.onTap,
    required this.buttonText, // Add this parameter
  });

  final void Function() onTap;
  final String buttonText; // Declare the buttonText

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 64, 2, 106),
        foregroundColor: const Color.fromARGB(255, 251, 251, 251),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        buttonText, // Use buttonText here to display the text on the button
        textAlign: TextAlign.center,
      ),
    );
  }
}
