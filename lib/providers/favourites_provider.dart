import 'package:flutter_riverpod/legacy.dart';
import 'package:meals/models/meals.dart';

//using a stateNotifier - and alternative to stateProvider
//here u create ur clsss that extends StateNotifier
//the class holds the logic

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  //constructor then adding initial value, in this case - empty list
  //the initial value is defined in the inside super()
  FavoritesMealsNotifier() : super([]);

  //method to toggle meas as fav
  bool toggleFavoriteMeal(Meal meal) {
    //check if the meal is a favorite
    final mealIsFavorite = state.contains(meal);
    //for removing
    if (mealIsFavorite) {
      state = state.where((m) {
        //if the m.id doesnt match meal.id keep it, else remove
        return m.id != meal.id; //only keep those that don't match
      }).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }

  //method to clear favorite list
  void clearFavMeals() {
    state = [];
  }
}

// creating a provider (outside the class)
final favoritesMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
      //returns an instance of our stateNotifier class
      return FavoritesMealsNotifier();
    });
