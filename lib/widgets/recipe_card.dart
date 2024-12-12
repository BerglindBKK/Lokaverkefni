import 'package:flutter/material.dart';
import 'package:lokaverkefni/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.onTap,
    required this.cardText,
    //required this.title
  // required this.cookingTime
  // required this.photo
  });

  final void Function() onTap;
  final String cardText;
  //final String title;

  //final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      //child: Padding(
      //  padding const EdgeInsets.symmetric(
      //    horizontal: 20,
      //    vertical: 16,
      //  ),
        //child: Text(recipe.title),

      child: Text(cardText),
      //),
    );
  }
}