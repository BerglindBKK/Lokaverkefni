import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

//for creating id
const uuid = Uuid();

enum Category {meat, fish, pasta, salad}

const categoryIcons = {
  Category.meat: Icons.lunch_dining,
  Category.fish: Icons.flight_takeoff,
  Category.pasta: Icons.movie,
  Category.salad: Icons.work,
};

class Recipe {
  Recipe({
    required this.title,
    //required this.instructions,
    //required this.ingredients,
    //required this.cookingTime,
}) : id = uuid.v4();

  final String id;
  final String title;
  //final String instructions;
  //final String ingredients;
  //final double cookingTime;
  //final Category category;

}