import 'package:flutter/material.dart';
import 'package:lokaverkefni/theme.dart';
import 'package:lokaverkefni/widgets/main_screen_button.dart';
import 'package:text_hover/config.dart';
import 'package:text_hover/text_hover.dart';
//import 'package:lokaverkefni/widgets/floating_action_button.dart';

// The welcome page
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.onNavigate});

  final void Function(String screen) onNavigate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Stack for overlaying widgets on top of each other (background + content)
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                // image: AssetImage('assets/images/recipe_app_landing.jpg'), // Doesn't work
                image: NetworkImage('https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                fit: BoxFit.cover, // Image covers the entire screen
              ),
            ),
          ),
          // Overlay content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Center the buttons horizontally
              children: [
                // Button 1
                SizedBox(
                  width: double.infinity,
                  child: MainScreenButton(
                    onTap: () => onNavigate('all-recipes'),
                    buttonText: 'ALL RECIPES',
                  ),
                ),
                const SizedBox(height: 10),
                // Button 2
                SizedBox(
                  width: double.infinity,
                  child: MainScreenButton(
                    onTap: () => onNavigate('add-recipes'),
                    buttonText: 'ADD A RECIPE',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Use floatingActionButton property to add the button
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        onPressed: () => onNavigate('add-recipes'),
        //child: Stack(
        //  alignment: Alignment.center,  // Aligns the widgets in the center
        //  children: [
        child: const Icon(Icons.add),  // Icon inside the button
        //    Positioned(
        //      bottom: 0,  // Position the text below the icon
              //child: TextHover(
              //  text: 'Aesthetic Ethiel',
              //  config: Config(
              //    hoverColor: Colors.red,
              //    textColor: Colors.black,
               // ),
              //),
            //),
          //],
        //),
      ),
    );
  }
}
