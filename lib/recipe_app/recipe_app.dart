import 'package:flutter/material.dart';
import 'package:lokaverkefni/recipe_app/screens/add_recipe.dart';
import 'package:lokaverkefni/recipe_app/screens/all_recipies_screen.dart';
import 'package:lokaverkefni/recipe_app/screens/welcome_screen.dart';
import '../theme.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  // Sets the default screen to the welcome screen
  String activeScreen = 'welcome-screen';
  String appBarTitle = "Recipe App";

  // Switches to the active screen
  void switchScreen(String screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Debugging: Print active primary color
    final primaryColor = Theme.of(context).colorScheme.primary;
    print("THEME_LOG: Active primary color: $primaryColor");
    print("AppBar primary color: $primaryColor"); // Debugging line

    // Determine the active screen
    Widget screenWidget;
    switch (activeScreen) {
      case 'all-recipes':
        screenWidget = AllRecipesScreen(onBack: () => switchScreen('welcome-screen'));
        appBarTitle = "All Recipes";
        break;
      case 'add-recipes':
        screenWidget = AddRecipesScreen(onBack: () => switchScreen('welcome-screen'), title: appBarTitle);
        appBarTitle = "Add a Recipe";
        break;
      default:
        screenWidget = WelcomeScreen(onNavigate: switchScreen);
        appBarTitle = "Welcome"; // Set AppBar title for WelcomeScreen
    }

    return MaterialApp(
      theme: lightTheme,  // Use the light theme defined in theme.dart
      darkTheme: darkTheme,  // Use the dark theme defined in theme.dart
      //themeMode: ThemeMode.light, // Force the app to always use the light theme
      home: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          elevation: 10, // Controls how high the shadow appears
          // Set shadowColor to customize the shadow color
          shadowColor: Colors.black.withOpacity(0.5), // Customize the shadow colo
        ),
        body: screenWidget,
      ),
    );


  }
}
