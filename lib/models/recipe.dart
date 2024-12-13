//the recipe class, also defines the categories
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

//for creating id
const uuid = Uuid();

//defines the categories
enum Category {meat, fish, pasta, salad, dessert}

//defines icons for each category
const categoryIcons = {
  Category.meat: Icons.lunch_dining,
  Category.fish: Icons.flight_takeoff,
  Category.pasta: Icons.movie,
  Category.salad: Icons.work,
  Category.dessert: Icons.work,
};

class Recipe {
  Recipe({
    required this.title,
    required this.instructions,
    required this.ingredients,
    required this.cookingTime,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String instructions;
  final String ingredients;
  final String cookingTime;
  final Category category;

}