import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    this.title,
    required this.onToggleFav,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFav;

  @override
  Widget build(BuildContext context) {
    Widget maincontent = const Center(child: Text('Nothing'));

    if (meals.isNotEmpty) {
      maincontent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, idx) {
          return MealItem(meal: meals[idx], onToggleFav: onToggleFav);
        },
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: maincontent,
    );
  }
}
