import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lokaverkefni/recipe_app/recipe_app.dart';  // Import RecipeApp

void main() {
  testWidgets('RecipeApp widget test', (WidgetTester tester) async {
    // Build the RecipeApp widget
    await tester.pumpWidget(const RecipeApp());

    // Verify if the app displays the welcome screen
    expect(find.text('Welcome to Recipe App!'), findsOneWidget);  // Assuming your WelcomeScreen has this text
  });
}
