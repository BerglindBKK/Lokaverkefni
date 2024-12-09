//this file called by the main file
//manages states and states and determines which screen is displayed:
  //add a recipe
  //search for a recipe
  //see all recipes
  //random recipe

import 'package:flutter/material.dart';
import 'package:lokaverkefni/recipe_app/screens/all_recipies_screen.dart';
import 'package:lokaverkefni/recipe_app/screens/welcome_screen.dart';

import '../main.dart';

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
      default:
        screenWidget = WelcomeScreen(onNavigate: switchScreen);
    }

    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            //backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
      ),
      // themeMode: ThemeMode.system, // default
      home: Scaffold(
        appBar: AppBar(title: const Text("Recipe App")),
        body: screenWidget,
      ),
    );
  }
}

