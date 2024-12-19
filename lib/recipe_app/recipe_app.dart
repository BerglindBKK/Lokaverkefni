import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';
import 'package:lokaverkefni/recipe_app/screens/add_recipes_screen.dart';
import 'package:lokaverkefni/recipe_app/screens/all_recipes_screen.dart';
import 'package:lokaverkefni/recipe_app/screens/welcome_screen.dart';
import 'package:lokaverkefni/data/recipe_data.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  String activeScreen = 'welcome-screen';
  String appBarTitle = "Recipe App";

  final List<Recipe> _registeredRecipes = RecipeData.registeredRecipes;

  // Function to add a new recipe
  void _addRecipe(Recipe newRecipe) {
    setState(() {
      _registeredRecipes.add(newRecipe);
    });
  }

  // Function to switch between screens
  void switchScreen(String screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  @override
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
        screenWidget = AddRecipesScreen(
          onBack: () => switchScreen('all-recipes'),
          title: appBarTitle,
          onAddRecipe: _addRecipe,  // virkar ekki ennþá
        );
        appBarTitle = "Add a Recipe";
        break;
      default:
        screenWidget = WelcomeScreen(onNavigate: switchScreen);
        appBarTitle = "Welcome";
    }

    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        /*
        appBar: AppBar(
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => switchScreen('welcome-screen'),
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ],
              //title: Text(appBarTitle),
              //elevation: 10,
              //shadowColor: Colors.black.withOpacity(0.5),
            )
          )
        ),*/
        body: screenWidget,
      ),
    );
  }
}
