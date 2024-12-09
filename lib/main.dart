//Runs the RecipeApp that manages states and logic for the app

import 'package:flutter/material.dart';
import 'package:lokaverkefni/recipe_app/recipe_app.dart';

//color schemes
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 43, 205, 132),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 177, 136, 31),
);

void main() {
  runApp(const RecipeApp());
}
