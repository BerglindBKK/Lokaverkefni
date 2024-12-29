//Runs the RecipeApp that manages states and logic for the app

import 'package:flutter/material.dart';
import 'package:lokaverkefni/recipe_app/recipe_app.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const RecipeApp());
}

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const RecipeApp());
}*/