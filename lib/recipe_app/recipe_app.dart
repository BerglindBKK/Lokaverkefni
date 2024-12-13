//Manages the screens and returns the screenwidget

import 'package:flutter/material.dart';
import 'package:lokaverkefni/recipe_app/screens/add_recipe.dart';
import 'package:lokaverkefni/recipe_app/screens/all_recipies_screen.dart';
import 'package:lokaverkefni/recipe_app/screens/welcome_screen.dart';
import '../theme.dart';
import 'package:lokaverkefni/models/recipe.dart';
import 'package:lokaverkefni/widgets/recipes.dart';
import 'package:lokaverkefni/data/recipe_data.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  String activeScreen = 'welcome-screen';
  String appBarTitle = "Recipe App";


  // Access registeredRecipes from the RecipeData class
  final List<Recipe> _registeredRecipes = RecipeData.registeredRecipes;

  //Sets the current screen
  void switchScreen(String screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  @override
  //decides on which screen to display
  Widget build(BuildContext context) {
    Widget screenWidget;
    switch (activeScreen) {
      case 'all-recipes':
        screenWidget = AllRecipesScreen(
          onBack: () => switchScreen('welcome-screen'),
          recipes: _registeredRecipes,
        );
        appBarTitle = "All Recipes";
        break;
      case 'add-recipes':
        screenWidget = AddRecipesScreen(onBack: () => switchScreen('welcome-screen'), title: appBarTitle);
        appBarTitle = "Add a Recipe";
        break;
      default:
        screenWidget = WelcomeScreen(onNavigate: switchScreen);
        appBarTitle = "Welcome";
    }

    //returns Appbar with the corresponding appbar title
    //returns the screenwidget
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          elevation: 10,
          shadowColor: Colors.black.withOpacity(0.5),
          //leading: IconButton(
            //icon: const Icon(Icons.arrow_back),
            //onPressed: () {
              // Handle the back navigation using Navigator.pop()
              ///Navigator.pop(context);
            //},
          //),
        ),
        body: screenWidget,
      ),
    );
  }
}