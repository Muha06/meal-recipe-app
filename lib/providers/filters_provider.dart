import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
    : super({
        Filters.glutenFree: false,
        Filters.lactoseFree: false,
        Filters.vegetarian: false,
        Filters.vegan: false,
      });

  void setFilter(Filters filter, bool isActive) {
    //re assign state to a another cloned map
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>((ref) {
      return FiltersNotifier();
    });

final userFilteredMealsProvider = Provider<List<Meal>>((ref) {
  final allMeals = ref.watch(mealsProvider);
  final filteredMeals = ref.watch(filtersProvider);

  return allMeals.where((meal) {
    //filters if a meal is meets some cond
    //if a selectedFilter(false) && meal.conditions  is false
    if (filteredMeals[Filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filteredMeals[Filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filteredMeals[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    if (filteredMeals[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
