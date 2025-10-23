import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meals_screen.dart';

class TabsScreens extends StatefulWidget {
  const TabsScreens({super.key});

  @override
  State<TabsScreens> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreens> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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

    Widget activePage = CategoriesScreen(
      onToggleFav: togglefavoriteStatus,
    );
    if (selectedIndex == 1) {
      activePage = MealsScreen(
        meals: favouritesMeals,
        onToggleFav: togglefavoriteStatus,
        title: 'Your Favs',
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('dynamic...')),
      body: activePage,
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
