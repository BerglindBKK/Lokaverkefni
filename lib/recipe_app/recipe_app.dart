//this file called by the main file
//manages states and states and determines which screen is displayed:
  //add a recipe
  //search for a recipe
  //see all recipes
  //random recipe

import 'package:flutter/material.dart';
import 'package:lokaverkefni/recipe_app/screens/add_recipe.dart';
import 'package:lokaverkefni/recipe_app/screens/all_recipies_screen.dart';
import 'package:lokaverkefni/recipe_app/screens/welcome_screen.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  //sets the default screen to the welcome screen
  String activeScreen = 'welcome-screen';

  // switches to the active screen
  void switchScreen(String screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine the active screen
    Widget screenWidget;

    switch (activeScreen) {
      case 'all-recipes':
        screenWidget = AllRecipesScreen(onBack: () => switchScreen('welcome-screen'));
        break;
      case 'add-recipes':
        screenWidget = AddRecipesScreen(onBack: () => switchScreen('welcome-screen'));
        break;
      default:
        screenWidget = WelcomeScreen(onNavigate: switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Recipe App ukghvkhj")),
        body: screenWidget,
      ),
    );
  }
}