import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/meals_drawer.dart';

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegan: false,
  Filters.vegetarian: false,
};

class TabsScreens extends StatefulWidget {
  const TabsScreens({super.key});

  @override
  State<TabsScreens> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreens> {
  Map<Filters, bool> _selectedFilters = kInitialFilters;

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //filtering meals and storing filtered meals into a list
    final availableMeals = dummyMeals.where((meal) {
      //filters if a meal is meets some cond
      //if a selectedFilter(false) && meal.conditions  is false
      if (_selectedFilters[Filters.glutenFree]! &&
          !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filters.lactoseFree]! &&
          !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filters.vegetarian]! &&
          !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    final List<Meal> favouritesMeals = [];
    void togglefavoriteStatus(Meal meal) {
      final isExisting = favouritesMeals.contains(meal);
      if (isExisting) {
        setState(() {
          favouritesMeals.remove(meal);
        });
      } else {
        setState(() {
          favouritesMeals.add(meal);
        });
      }
    }

    //catgories screen
    Widget activePage = CategoriesScreen(
      onToggleFav: togglefavoriteStatus,
      userFilteredMeals: availableMeals,
    );
    if (selectedIndex == 1) {
      activePage = MealsScreen(
        meals: favouritesMeals,
        onToggleFav: togglefavoriteStatus,
        title: 'Your Favs',
      );
    }

    void setScreen(String identifier) async {
      if (identifier == 'Filter') {
        Navigator.pop(context);
        //push to filterscreen and whatever data store it to results
        final results = await Navigator.push<Map<Filters, bool>>(
          context,
          MaterialPageRoute(
            builder: (ctx) =>
                FiltersScreen(currentFilters: _selectedFilters),
          ),
        );
        setState(() {
          _selectedFilters = results ?? kInitialFilters;
        });
      } else {
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('dynamic...')),
      body: activePage,
      drawer: MealsDrawer(onselectTile: setScreen),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        selectedItemColor: Colors.indigo,

        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
