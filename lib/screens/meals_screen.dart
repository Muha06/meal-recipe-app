import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends ConsumerWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    this.title,
    this.isFavScreen = false,
  });

  final String? title;
  final List<Meal> meals;
  final bool isFavScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget maincontent = const Center(child: Text('Nothing'));

    if (meals.isNotEmpty) {
      maincontent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, idx) {
          return MealItem(meal: meals[idx]);
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        actions: [
          if (isFavScreen)
            TextButton(
              onPressed: () {
                ref.read(favoritesMealsProvider.notifier).clearFavMeals();
              },
              child: const Text(
                "Clear List",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
      body: maincontent,
    );
  }
}
